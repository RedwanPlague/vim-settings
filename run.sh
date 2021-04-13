fullfile=$1
extention=${fullfile##*.}
filename=${fullfile%.*}

# echo "$fullfile"
# echo "$filename" "$extention"

# handling extentionless file names like 'main'
if [ "$extention" = "$fullfile" ]; then
    echo "***** Sorry, cannot run file with no extention *****"
    exit
fi

if [ "$extention" = 'cpp' ]; then
    g++-10 -std=c++17 -D REDWAN "$fullfile"; ./a.out
elif [ "$extention" = 'c' ]; then
    gcc-10 -D REDWAN "$fullfile"; ./a.out
elif [ "$extention" = 'java' ]; then
    javac "$fullfile"; java "$filename"
elif [ "$extention" = 'py' ]; then
    python3 "$fullfile"
elif [ "$extention" = 'js' ]; then
    node "$fullfile"
elif [ "$extention" = 'sh' ]; then
    bash "$fullfile"
elif [ "$extention" = 'tcl' ]; then
    tclsh "$fullfile"
else
    echo "***** Sorry, cannot run file with extention '${extention}' *****"
fi
