#!/bin/bash

echo -e "\e[1;35mLight
╭━━━╮╱╱╱╱╱╭╮
┃╭━╮┃╱╱╱╱╭╯╰╮
┃┃╱╰╋━━┳━╋╮╭╋━┳━━┳━━┳━━┳━╮╭━━╮
┃┃╱╭┫╭╮┃╭╮┫┃┃╭┫╭╮┃━━┫┃━┫╭╮┫╭╮┃
┃╰━╯┃╰╯┃┃┃┃╰┫┃┃╭╮┣━━┃┃━┫┃┃┃╭╮┃
╰━━━┻━━┻╯╰┻━┻╯╰╯╰┻━━┻━━┻╯╰┻╯╰╯
╭━━━╮
┃╭━╮┃
┃┃╱╰╋━━┳━╮
┃┃╭━┫┃━┫╭╮╮
┃╰┻━┃┃━┫┃┃┃
╰━━━┻━━┻╯╰╯\e[0m"

echo -e "\e[31mGENERADOR DE CONTRASEÑAS\e[0m"

# Función para generar una contraseña segura
generate_password() {
    local length=16
    local charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|"
    local password=$(tr -dc "$charset" < /dev/urandom | head -c "$length")
    echo "$password"
}

# Función para generar nombres latinos
generate_latin_name() {
    local firstname=("Alejandro" "Sofía" "Guillermo" "Fernanda" "Javier" "Lucía" "Diego" "Camila" "Raúl" "Valentina")
    local lastname=("Gutiérrez" "Martínez" "Sánchez" "Rodríguez" "Fernández" "Gómez" "Díaz" "Vargas" "Reyes" "Morales")
    local name="${firstname[$RANDOM % ${#firstname[@]}]} ${lastname[$RANDOM % ${#lastname[@]}]}"
    echo "$name"
}

# Función principal
main() {
    echo "¿Cuántas contraseñas deseas generar?"
    read -r num_passwords

    mkdir -p /sdcard/PasswordGenerator
    for i in $(seq 1 "$num_passwords"); do
        name=$(generate_latin_name)
        password=$(generate_password)
        echo "$name: $password" >> /sdcard/PasswordGenerator/passwords.txt
        echo "Contraseña generada para $name"
    done

    echo "Las contraseñas se han guardado en /sdcard/PasswordGenerator/passwords.txt"
}

main