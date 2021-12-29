spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

RED='\033[0;31m'
NC='\033[0m' # No Color
boldon=`tput bold`
boldoff=`tput sgr0`

commend_runner() {
    clear >$(tty)
    printf "\nRunning: >${RED} $1${NC}\n"
    printf "Explanation: ${boldon}$3${boldoff} \n"
    spinner & 
    eval "$1"
    sleep $2
    kill "$!" # kill the spinner
    printf '\n'
}
#commend_runner "nmap -A -T4 scanme.nmap.org" 10
commend_runner "ls -al" 3 "This is an examplanation"
commend_runner "fuser -v ~ && notify-send 'title' 'message'" 2 "Show which processes use the files/directories"
#commend_runner "lsof -P -i -n" 2 "Show process that use internet connection at the moment"
#commend_runner "lsof -i tcp:443" 2 "Show process that use specific port number"
#commend_runner "ps awwfux | less -S" 2 "Show a 4-way scrollable process tree with full details"
#commend_runner "find / -mmin 60 -type f" 2 "Find files that have been modified on your system in the past 60 minutes"



