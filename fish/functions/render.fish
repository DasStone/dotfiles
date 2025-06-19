function render
    if test (count $argv) -ne 1
        echo "Usage: render <input>.md"
        return 1
    end

    set input $argv[1]
    set base (basename $input .md)
    set output "$base.pdf"

    pandoc "$input" -V colorlinks=true --variable=geometry:"margin=1in" -o "$output"
end
