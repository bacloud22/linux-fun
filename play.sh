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

commend_runner() {
    clear >$(tty)
    printf "\nRunning >${RED} $1${NC}\n"
    spinner & 
    eval "$1"
    sleep $2
    kill "$!" # kill the spinner
    printf '\n'
}
commend_runner "nmap -A -T4 scanme.nmap.org" 10
commend_runner "ls -al" 10
