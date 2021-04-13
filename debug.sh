fullfile=$1
extention=${fullfile##*.}
filename=${fullfile%.*}

# echo "$fullfile"
# echo "$filename" "$extention"

# handling extentionless file names like 'main'
if [ "$extention" = "$fullfile" ]; then
    echo "***** Sorry, cannot debug file with no extention *****"
    exit
fi

if [ "$extention" = 'cpp' ]; then
    g++-10 -std=c++17 -g -D REDWAN "$fullfile"; gdb ./a.out
elif [ "$extention" = 'c' ]; then
    gcc-10 -g -D REDWAN "$fullfile"; gdb ./a.out
else
    echo "***** Sorry, cannot debug file with extention '${extention}' *****"
fi
