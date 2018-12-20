# Alias'

## Lyra decrypt and encrypt
alias decrypt='lyra decrypt'
alias encrypt='lyra encrypt'

# Functions

## Generate passwords using lyra
genpass () {
 if [[ "${1}" = "-ns" ]]; then
   lyra generate --rm-spaces --words $2 --phrases $3
 else
   lyra generate --words $1 --phrases $2
 fi
}

## File extraction
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

## Runs a ls immediately when you're inside a file. 
cl() {
 if [ -d $1 ] ; then
	cd $1
	ls 
 else
	echo "'$1' not a dir..."
 fi
}

# Terminal config
PS1="[\u][\@] \w $ "
