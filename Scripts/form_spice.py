"""
SPICE Model Viewer and Extractor for KiCad
with persistent configuration and dual tabs (Search & Config).

Features:
- Automatically prioritizes variants from:
    1. Manufacturer/*
    2. uncategorized/spice_complete/*
    3. uncategorized/*
- Displays list of "VARIANT  [LIB_PATH]"
- Highlights the recommended variant.
- Config tab: edit paths for scripts and output folder.
- "Copy full .lib" button to import the complete library file.
- Saves `scripts_dir` and `output_dir` in `config.json` next to the script.
"""
import os
import sys
import json
import subprocess
import shutil
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext, filedialog

class SpiceForm(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("KiCad SPICE Model Viewer")
        self.geometry("950x700")
        self.minsize(800, 600)

        # Configuration file located beside the script
        self.config_file = os.path.join(os.path.dirname(__file__), 'config.json')
        # Default paths
        default = {
            'scripts_dir': r'D:/kicad/library/KiCad-Spice-Library/Scripts',
            'output_dir':  r'D:/kicad/library/my-lib'
        }
        # Load persisted config or use default
        cfg = default.copy()
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    cfg.update(data)
            except Exception:
                pass

        # Assign paths
        self.scripts_dir = cfg['scripts_dir']
        self.models_dir  = os.path.abspath(os.path.join(self.scripts_dir, '..', 'Models'))
        self.output_dir  = cfg['output_dir']
        os.makedirs(self.output_dir, exist_ok=True)

        # Search results data
        self.variants = []
        self.lib_paths = []

        # TTK styling
        style = ttk.Style(self)
        style.configure('TNotebook.Tab', padding=[10, 5])
        style.configure('TButton', padding=5)
        style.configure('TEntry', padding=5)
        style.configure('TLabel', padding=5)

        # Build UI
        self._build_ui()
        self.protocol("WM_DELETE_WINDOW", self._on_close)

    def _build_ui(self):
        notebook = ttk.Notebook(self)
        notebook.pack(fill=tk.BOTH, expand=True)

        # Search tab
        tab_search = ttk.Frame(notebook)
        notebook.add(tab_search, text="Search")
        self._build_search_tab(tab_search)

        # Config tab
        tab_conf = ttk.Frame(notebook)
        notebook.add(tab_conf, text="Configuration")
        self._build_config_tab(tab_conf)

    def _build_search_tab(self, frame):
        frame.columnconfigure(1, weight=1)
        frame.rowconfigure(3, weight=1)

        ttk.Label(frame, text="SPICE Model:").grid(row=0, column=0, sticky="w")
        self.entry = ttk.Entry(frame)
        self.entry.grid(row=0, column=1, sticky="we")
        ttk.Button(frame, text="Search",         command=self.on_search).grid(row=0, column=2)
        ttk.Button(frame, text="Extract",        command=self.on_extract).grid(row=0, column=3)
        ttk.Button(frame, text="Export",         command=self.on_export).grid(row=0, column=4)
        ttk.Button(frame, text="Copy full .lib", command=self.on_copy_full).grid(row=0, column=5)

        self.recom_label = ttk.Label(frame, text="Recommended variant: —", foreground="blue")
        self.recom_label.grid(row=1, column=0, columnspan=6, sticky="w")

        self.listbox = tk.Listbox(frame, font=("Consolas", 10))
        self.listbox.grid(row=2, column=0, columnspan=6, sticky="nsew")

        self.output = scrolledtext.ScrolledText(frame, wrap="none", font=("Consolas", 10))
        self.output.grid(row=3, column=0, columnspan=6, sticky="nsew")

    def _build_config_tab(self, frame):
        frame.columnconfigure(1, weight=1)

        ttk.Label(frame, text="Scripts Directory:").grid(row=0, column=0, sticky="w")
        self.scripts_var = tk.StringVar(value=self.scripts_dir)
        ent_scripts = ttk.Entry(frame, textvariable=self.scripts_var)
        ent_scripts.grid(row=0, column=1, sticky="we")
        ttk.Button(frame, text="…", width=3, command=self._browse_scripts).grid(row=0, column=2)

        ttk.Label(frame, text="Output Directory:").grid(row=1, column=0, sticky="w")
        self.output_var = tk.StringVar(value=self.output_dir)
        ent_output = ttk.Entry(frame, textvariable=self.output_var)
        ent_output.grid(row=1, column=1, sticky="we")
        ttk.Button(frame, text="…", width=3, command=self._browse_output).grid(row=1, column=2)

        ttk.Button(frame, text="Save Configuration", command=self._save_config).grid(row=2, column=1, pady=10)

    def _browse_scripts(self):
        directory = filedialog.askdirectory(title="Select Scripts Dir", initialdir=self.scripts_dir)
        if directory:
            self.scripts_var.set(directory)

    def _browse_output(self):
        directory = filedialog.askdirectory(title="Select Output Dir", initialdir=self.output_dir)
        if directory:
            self.output_var.set(directory)

    def _save_config(self):
        # Update and save to config.json
        self.scripts_dir = self.scripts_var.get().strip()
        self.output_dir  = self.output_var.get().strip()
        os.makedirs(self.output_dir, exist_ok=True)
        cfg = {'scripts_dir': self.scripts_dir, 'output_dir': self.output_dir}
        try:
            with open(self.config_file, 'w', encoding='utf-8') as f:
                json.dump(cfg, f, indent=2)
            messagebox.showinfo("Configuration", "Settings saved successfully.")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to save configuration:\n{e}")

    def on_search(self):
        model = self.entry.get().strip()
        if not model:
            messagebox.showwarning("Input Required", "Please enter a SPICE model name.")
            return

        script = os.path.join(self.scripts_dir, "check_supported.py")
        try:
            output = subprocess.check_output(
                [sys.executable, script, model.lower()],
                cwd=os.path.dirname(self.scripts_dir),
                stderr=subprocess.STDOUT,
                text=True
            )
        except subprocess.CalledProcessError as e:
            output = e.output or "Search failed."

        # Parse exact matches
        self.variants.clear()
        self.lib_paths.clear()
        lines = output.splitlines()
        i = 0
        while i < len(lines):
            line = lines[i].strip()
            if line.endswith(" found in"):
                var = line.split()[0]
                i += 1
                paths = []
                while i < len(lines) and lines[i].strip().startswith("-"):
                    paths.append(lines[i].strip()[1:].strip())
                    i += 1
                if paths:
                    self.variants.append(var)
                    self.lib_paths.append(paths[0])
                continue
            i += 1

        # Fallback suggestions
        if not self.variants:
            import re
            m = re.search(r"maybe you meant one of these: (.+)$", output)
            if m:
                for suggestion in [s.strip() for s in m.group(1).split(',')]:
                    try:
                        out2 = subprocess.check_output(
                            [sys.executable, script, suggestion],
                            cwd=os.path.dirname(self.scripts_dir),
                            stderr=subprocess.DEVNULL,
                            text=True
                        )
                    except subprocess.CalledProcessError:
                        continue
                    for l2 in out2.splitlines():
                        if l2.strip().startswith("-"):
                            path = l2.strip()[1:].strip()
                            self.variants.append(suggestion)
                            self.lib_paths.append(path)
                            break

        # Prioritize order
        def priority(p):
            if p.startswith("Manufacturer"): return 0
            if "spice_complete" in p:     return 1
            return 2

        combined = list(zip(self.variants, self.lib_paths))
        combined.sort(key=lambda x: priority(x[1]))
        if combined:
            vs, ps = zip(*combined)
            self.variants = list(vs)
            self.lib_paths = list(ps)
        else:
            self.variants = []
            self.lib_paths = []

        # Update listbox and label
        self.listbox.delete(0, tk.END)
        for v, p in zip(self.variants, self.lib_paths):
            self.listbox.insert(tk.END, f"{v:<14} [{p}]")

        if self.variants:
            self.recom_label.config(
                text=f"Recommended variant: {self.variants[0]} [{self.lib_paths[0]}]"
            )
        else:
            self.recom_label.config(text="Recommended variant: —")

        # Show raw output
        self.output.delete("1.0", tk.END)
        self.output.insert(tk.END, output)

    def _extract_to_file(self, idx):
        var = self.variants[idx]
        rel = self.lib_paths[idx]
        spec = f"{var}#{rel}"  # pass model#relpath
        out  = os.path.join(self.output_dir, f"{var}.lib")
        cmd  = ["perl", os.path.join(self.scripts_dir, "extractModels.pl"), spec]
        try:
            with open(out, "w", encoding='utf-8') as f:
                subprocess.run(cmd, cwd=self.scripts_dir, stdout=f, stderr=subprocess.DEVNULL, check=True)
        except subprocess.CalledProcessError:
            messagebox.showerror("Error", f"Failed to extract '{var}'")
            return None
        return out

    def on_extract(self):
        sel = self.listbox.curselection()
        if not sel:
            messagebox.showwarning("Selection Required", "Please select a variant to extract.")
            return
        filepath = self._extract_to_file(sel[0])
        if filepath:
            with open(filepath, encoding='utf-8') as f:
                content = f.read()
            self.output.delete("1.0", tk.END)
            self.output.insert(tk.END, content)

    def on_export(self):
        sel = self.listbox.curselection()
        if not sel:
            messagebox.showwarning("Selection Required", "Please select a variant to export.")
            return
        var = self.variants[sel[0]]
        out = os.path.join(self.output_dir, f"{var}.lib")
        if not os.path.exists(out):
            out = self._extract_to_file(sel[0])
        if out:
            messagebox.showinfo("Exported", f"Saved to:\n{out}")

    def on_copy_full(self):
        sel = self.listbox.curselection()
        if not sel:
            messagebox.showwarning("Selection Required", "Please select a variant to copy full .lib.")
            return
        rel  = self.lib_paths[sel[0]]
        src  = os.path.join(self.models_dir, rel)
        dest = os.path.join(self.output_dir, os.path.basename(rel))
        try:
            shutil.copy(src, dest)
            messagebox.showinfo("Copied", f"Full library copied to:\n{dest}")
        except Exception as ex:
            messagebox.showerror("Error", f"Copy failed:\n{ex}")

    def _on_close(self):
        self.destroy()
        sys.exit(0)

if __name__ == "__main__":
    try:
        SpiceForm().mainloop()
    except KeyboardInterrupt:
        pass
