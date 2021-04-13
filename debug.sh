fullfile=$1
extension="${fullfile##*.}"
filename="${fullfile%.*}"

case "$extension" in
    "$fullfile")
        echo "***** ERROR: no extension *****"
        exit 1
        ;;
    "c")
        gcc -D REDWAN -g "$fullfile"
        gdb ./a.out
        ;;
    "cpp")
        g++ -std=c++17 -D REDWAN -g "$fullfile"
        gdb ./a.out
        ;;
    "js")
        node inspect "$fullfile"
        ;;
    *)
        echo "***** ERROR: unknown extension *****"
        exit 1
        ;;
esac
