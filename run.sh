fullfile=$1
extension="${fullfile##*.}"
filename="${fullfile%.*}"

case "$extension" in
    "$fullfile")
        echo "***** ERROR: no extension *****"
        exit 1
        ;;
    "c")
        gcc -D REDWAN "$fullfile"
        ./a.out
        ;;
    "cpp")
        g++ -std=c++17 -D REDWAN "$fullfile"
        ./a.out
        ;;
    "java")
        javac "$fullfile"
        java "$filename"
        ;;
    "python")
        python3 "$fullfile"
        ;;
    "js")
        node "$fullfile"
        ;;
    "sh")
        bash "$fullfile"
        ;;
    "lua")
        lua "$fullfile"
        ;;
    "tcl")
        tclsh "$fullfile"
        ;;
    *)
        echo "***** ERROR: unknown extension *****"
        exit 1
        ;;
esac
