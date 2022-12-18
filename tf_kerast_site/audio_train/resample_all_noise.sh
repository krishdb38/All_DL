for dir in `ls -1 ./16000_pcm_speeches/noise/ `; do 
	for file in `ls -1 ./16000_pcm_speeches/noise/$dir/*.wav`; do
	sample_rate=`ffprobe -hide_banner -loglevel panic -show_streams $file | grep sample_rate | cut -f2 -d=`;
	if [ $sample_rate -ne 16000 ] ; then
	ffmpeg -hide_banner -loglevel panic -y -i $file -ar 16000 temp.wav;
	mv temp.wav $file;
	fi;done; done;
echo "All done "