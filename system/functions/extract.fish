function extract -d "extract of compressed-files"
    echo $argv | read -l archive
    
    if !$archive
        exit 0
    end

    if test -e $archive
        switch (lc $archive)
        case *.tar.bz2)
          tar xvjf $archive
        case *.tar.gz) 
          tar xvzf $archive
        case *.bz2
          bunzip2 $archive
        case *.rar
          unrar e $archive
        case *.gz 
          gunzip $archive
        case *.tar
          tar xvf $archive
        case *.tbz2)   
          tar xvjf $archive
        case *.tgz
          tar xvzf $archive
        case *.lha
          lha e $archive
        case *.zip
          unzip $archive
        case *.Z
          uncompress $archive
        case *.7z 
          7z x $archive
        case '*'
          echo "$archive cannot be extracted via >extract<"
              and exit 1
        end
    else
        echo "$archive is not a valid file"
    end
end