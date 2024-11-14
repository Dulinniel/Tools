# Tools

It just compîle tools I use daily, I will update it based on my need or on request. Bash files may not be executable so don't forget to : `chmod +x ./<filename>.sh` the first time you use them

## List

- [videoConverter](#videoConverter)

### videoConverter

A utility that use raw ffmpeg to convert a video format to another. The default Audio codec is set to VP9 and the default audio codec to libvorbis. If you want to change the used codec, there is two variables `AUDIO_CODEC` and `VIDEO_CODEC` that you can edit at the very begining of the file

Basic usage : 

```bash
./videoConverter.sh -i input.mp4 -o mkv
```

By default, the file you converted get moved to you current working directory. You can override this behaviour by specifying a folder to move the output file to, using the `-d` parameter such as:

```bash
./videoConverter.sh -i input.mp4 -o mkv -d ~/Videos
```

Now after the conversion, the file will automatically moved to Videos folder. Furthermore, you can automatically remove the input file from your system, by adding `-p` parameter to the command like : 

```bash
./videoConverter.sh -i input.mp4 -o mkv -p
```