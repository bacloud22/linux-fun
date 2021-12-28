spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

#clear >$(tty)
echo -e "\bthis is first command"
spinner & 
nmap -A -T4 scanme.nmap.org
sleep 10


clear >$(tty)
echo -e "\bthis is command second"
ls

kill "$!" # kill the spinner
printf '\n'
