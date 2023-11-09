#!/usr/bin/env perl
use strict;
require 5.10.0;

# Quick implementation to get models from library.
# Tries to read from "spiceModels.lst" if no arguments are provided

our $defaultModelList = "spiceModels.lst";

# Get paths
use File::Basename;
use File::Spec::Functions;
our $basePath=dirname(__FILE__);
use Cwd 'abs_path';
our $modelPath=catfile($basePath,'..','Models');
$modelPath=abs_path($modelPath);
our $checkSupportedScript=catfile($basePath,'check_supported.py');


# Define regular expressions 
our $commentsRegex='(?<comments>(?:(?<=\n)\s*#[^\R*]\R))*';
our $continuedNoParenLines='(?:(?<=\n)\+[^\R*()]\R)*'; # Note: regex not validated yet.
our $modelParenRegex='(?:\.model\s+_NAME_\s+(?<type>\S+)\s*\([^)]*\))';
our $modelLineRegex='(?:\.model\s+_NAME_\s+(?<type>\S+)\s*[^()]*?\R'.$continuedNoParenLines.')';
our $modelRegex="(?<model>$modelParenRegex|$modelLineRegex)";
our $subcktRegex='(?<subckt>^\.subckt\s+_NAME_\s+.*?^\.ends\s+_NAME_\s*)';
our $allRegex="(?<matched>${commentsRegex}[ \t]*((?:$modelRegex)\s*?)|$subcktRegex)";

# Extract a "model" from a file
sub extractFromFile {
   my ($name, $file)=@_;

   # Glob the file
   local $/;
   my $fh;
   open $fh, $file;
   my $fileContent=<$fh>; 
   close $fh;

   # Adapt the regular expression
   my $model;
   my $regex=$allRegex;
   my $quotedName=quotemeta($name);
   $regex=~s/_NAME_/$quotedName/g; # Match literal string

   # Extract the model from the file
   if($fileContent=~/$regex/ism) {
      $model=$+{matched}; 
   }
   
   # Return the result
   return $model;
}

# Get library by using 'check_supported.pl' script
#
# @param string Modelname
# @return ?string Short path to library
#
sub getBestFileForModel {
   my $modelName=shift;

   $modelName=~s/([$"])/\\$1/g;
   my $result=`$checkSupportedScript "$modelName"`;

   my $path;
   if($result=~/Found in\s+-\s+(?<path>.*?)\R/si) {
      $path=$+{path};
   }     

   return $path;
}


# Handle CLI/...
# 
# Determine which models to look for
#
my @models=();
if( scalar(@ARGV) ) {
   # Get from CLI arguments
   foreach my $modelSpec ( @ARGV ) {
      push @models,$modelSpec;
   }
} elsif ( -r $defaultModelList ) {
   # Get models from configuration file 

   # Glob the file
   local $/;
   my $fh;
   open $fh, $defaultModelList;
   my $fileContent=<$fh>;
   close $fh;
   @models=split(/\R/,$fileContent);
} else {
   # Simple test
   print "Retrieves models for simulations from list provided on CLI or $defaultModelList\n";
   print "Specify a model like this:\n";
   print " - 2N7000#Transistor/FET/MOS.lib, or\n";
   print " - 2N7000 without the library\n";
   print "\n";
   print "Sample Result:\n";
   push @models,'2N7000#Transistor/FET/MOS.lib';
}



#
# Get the models as requested
#
foreach my $modelSpec ( @models ) {
  $modelSpec=~/(?<modelName>[^#]*)(?:\#(?<path>.*))?/;
  my $file=$+{path};
  my $modelName=$+{modelName};

  if(!defined($file) || $file eq '') {
     $file=getBestFileForModel($modelName);
  }

  my $absFile=catfile($modelPath,$file);

  my $model=extractFromFile($modelName,$absFile);
  print "*\n* $modelName - Extracted from '$file'\n*\n$model\n";
}
