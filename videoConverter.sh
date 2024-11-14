#!/bin/bash

# @TODO: Add a parameter to change the used codec in the tool
AUDIO_CODEC=libvorbis
VIDEO_CODEC=vp9

VERSION="1.0.0"
AUTHOR="Dulinniel"
SOURCE="https://github.com/Dulinniel/Tools"
PURGE=false
DESTINATION=`pwd`
INPUT=None
OUTPUT=None

# Help function, display simple usage
function help()
{
  echo "usage: videoConverter -i /path/to/file -o video_extension [-d /path/to/output/dir] [-p]"
  echo "-i      Set the input file to convert"
  echo "-o      Set the video extension to convert to"
  echo "-d      If present, automatically move the output file to the desired location"
  echo "-p      If present, automatically delete the input file"
  echo "-h      Display this help"
  echo "-v      Display application version"
  echo "-a      Display the name of the author"
  echo "-s      Display the link to the source code"
}

# Display the tool version
function version()
{
  echo "$VERSION"
}

# Display the author name
function author()
{
  echo "$AUTHOR"
}

# Display the link to the source of the tool
function source()
{
  echo "$SOURCE"
}

# Parse short options
OPTIND=1
while getopts "d:i:o:p:hvas" opt
do
  case "$opt" in
    'i') INPUT="$OPTARG";;
    'd') DESTINATION="$OPTARG";;
    'o') OUTPUT="$OPTARG";;
    'p') PURGE=true;;
    'h') help; exit 0 ;;
    'v') version; exit 0 ;;
    'a') author; exit 0 ;;
    's') source; exit 0 ;;
  esac
done

# Remove options from positional parameters
shift $(expr $OPTIND - 1) 

# Check if the file is usable
if [ ! -f $INPUT ] || [ ! -e $INPUT ] 
then
  echo "File does not exist"
  exit -1
fi

# Concatenate input file name with output video extension
FINAL_FILE="${INPUT%%.*}.$OUTPUT"
# Convert it to output file using vp9 video codec and libvorbis video codec
ffmpeg -i $INPUT -c:v $VIDEO_CODEC -c:a $AUDIO_CODEC $FINAL_FILE
# Move the output file to the destination
mv $FINAL_FILE $DESTINATION
# If present, remove the original file
if [ $PURGE ] 
then
  rm -rf $INPUT
fi
