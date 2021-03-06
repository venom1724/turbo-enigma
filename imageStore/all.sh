#python ../preprocess/fft.py --image "$1" -e -bin
#python ../preprocess/split.py --image "$1"
#python ../preprocess/fft.py --image "split_final_$1" -e -bin -v

#olddpi=$(convert "split_final_$1" -format "%[resolution.x]" info:)

filter=25
offset=18
if [ "$2" != "" ]; then
    filter=$2
fi

if [ "$3" != "" ]; then
    offset=$3
fi


#python ../preprocess/deskew.py --image "split_final_$1"
textcleaner -g -e normalize -f "$filter" -o "$offset" -s 1 -a 0 -t 0 -T "split_final_$1" "out_$1"

#tesseract --psm 1 --oem 1 -l eng "out_$1" stdout 
#out_$1"
#-c tessedit_write_images=true
