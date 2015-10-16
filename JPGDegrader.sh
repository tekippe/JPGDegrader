#!/bin/bash
cd ${0%/*} //set current directory to the location of the script
	n=0;
	echo "Please enter the path to the jpg you want to degrade."
	read inputFile
	cp $inputFile input.jpg
	echo "How many generations of compression do you want?"
	read numPasses
	echo "Where do you want to store the converted files?"
	read targetDirectory
	echo "Target Directory "$targetDirectory/input.jpg
	echo $numPasses
	while ((i<=$numPasses)); do
		quality=$(( ( RANDOM % 100 )  + 1 ))
		/opt/ImageMagick/bin/convert input.jpg -quality $quality output.jpg
		cp input.jpg $targetDirectory/input.jpg
		mv $targetDirectory/input.jpg $targetDirectory/"input"$n'.jpg'
		mv output.jpg input.jpg
		n=$((n+1));
		let ++i
	done
	rm input.jpg

