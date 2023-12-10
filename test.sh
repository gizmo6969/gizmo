for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF');do
echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);'
done


for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF'); do
    hashed_mac=$(echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);')

    # Verifica se l'hash del MAC è presente nella variabile $stringa
    found=false
    for line in $stringa; do
        if [ "$hashed_mac" == "$line" ]; then
            found=true
            break
        fi
    done

    # Stampa il risultato del confronto
    if [ "$found" == true ]; then
        echo "Il MAC hash $hashed_mac è presente in \$stringa."
    else
        echo "Il MAC hash $hashed_mac non è presente in \$stringa."
    fi
done

for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF'); do
    hashed_mac=$(echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);')
    echo $hashed_mac
done

stringa=$(echo "
8be8748e26dbde86fb4073ec0f63eac9ec05fdf2
91045a8ebf57ea96122d654010d6861b28b88ba7
9618e2a2562b11b1f48128ebf2c71f8cefbc2d52
a14368bf806675f97e8935379d8c6bc6399a5869")

stringa=$(echo "
8be8748e26dbde86fb4073ec0f63eac9ec05fdf2
9618e2a2562b11b1f48128ebf2c71f8cefbc2d52
a14368bf806675f97e8935379d8c6bc6399a5869")


for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF'); do
    hashed_mac=$(echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);')

    # Verifica se l'hash del MAC è presente nella variabile $stringa
    found=false
    while IFS= read -r line; do
        if [ "$hashed_mac" == "$line" ]; then
            found=true
            break
        fi
    done <<< "$stringa"

    # Stampa il risultato del confronto
    if [ "$found" == true ]; then
        echo "Il MAC hash $hashed_mac è presente in \$stringa."
    else
        echo "Il MAC hash $hashed_mac non è presente in \$stringa."
    fi
done

for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF'); do
    hashed_mac=$(echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);')

    # Verifica se l'hash del MAC è presente nella variabile $stringa
    found=false
    while IFS= read -r line; do
        if [ "$hashed_mac" == "$line" ]; then
            found=true
            break
        fi
    done <<< "$stringa"

    # Stampa il risultato del confronto
    if [ "$found" == false ]; then
        echo "Il MAC hash $hashed_mac non è presente in \$stringa."
    fi
done

#######################################
destination="/etc/default/.hashok"
stringa_trovata=false

for mac in $(sed 's/\00:00:00:00:00:00//g' /sys/class/net/*/address | awk 'NF'); do
    hashed_mac=$(echo "$mac" | perl -le 'use Digest::SHA qw(sha1_hex); print sha1_hex(<>);')
    echo $hashed_mac
done

for i in $(seq 0 "$file_number"); do
    file="${destination}${i}"

    if [ -e "$file" ]; then
      stringa=
        if grep -q "\b$stringa1\b" "$file" 2>/dev/null; then
            # La stringa è stata trovata in almeno uno dei file
            stringa_trovata=true
            break
        fi
        if [ -e "$file" ]; then
            if grep -q ""$username"_hsh=" "$file" 2>/dev/null; then
                # La stringa è stata trovata in almeno uno dei file
                stringa_trovata=true
                stringadmi=$(grep ""$username"_dmi=" "$file" | awk -F"_dmi=" '{print $2}' | tr -d '\n')
                break
        fi
    else
        echo -e "\n \e[38;5;197m[File not found!]\e[0m\n"
        exit 1
    fi
done


########################################
destination="/etc/default/.hashok"
stringa_trovata=false

#for i in {0..3}; do
for i in $(seq 0 "$file_number"); do
    file="${destination}${i}"

    if [ -e "$file" ]; then
        if grep -q "\b$stringa1\b" "$file" 2>/dev/null; then
            # La stringa è stata trovata in almeno uno dei file
            stringa_trovata=true
            break
        fi
    else
        echo -e "\n \e[38;5;197m[File not found!]\e[0m\n"
        exit 1
    fi
done

# Verifica se la stringa è stata trovata in almeno uno dei file
if [ "$stringa_trovata" = false ]; then
    echo -e "\n \e[38;5;197m[Unregistered system!]\e[0m\n"
    echo -e "\n \e[38;5;154m[contact gentooplayers@gmail.com]\e[0m\n"
    exit 1
else
    rm /etc/default/.bhashs 2>/dev/null
fi
###############################################
