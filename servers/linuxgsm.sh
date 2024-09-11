#!/bin/bash

source functions.sh

add_and_setup_linuxgsm_user() {
    local username="$1"

    if id "$username" >/dev/null 2>&1; then
        echo "User '$username' already exists. Exiting script."
        exit 1  # Exit with a non-zero status code to indicate an error
    else
        sudo useradd -m -s /bin/zsh "$username"
        echo "User '$username' added successfully!"
        sudo passwd "$username"

        echo "Installing LinuxGSM"
        su - "$username" -c 'curl -Lo linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh'

        echo "Installing the game server"
        su - "$username" -c "./$username install"

        echo "Creating a service file"
        template=$(cat <<EOF
[Unit]
Description=LinuxGSM _USER Server
After=network-online.target
Wants=network-online.target

[Service]
Type=forking
User=_USER
WorkingDirectory=/home/_USER


#Assume that the service is running after main process exits with code 0
RemainAfterExit=yes
ExecStart=/home/_USER/_USER start
ExecStop=/home/_USER/_USER stop
Restart=no

[Install]
WantedBy=multi-user.target
EOF
)

        service_file_content=${template//_USER/$username}
        echo "$service_file_content" | sudo tee /etc/systemd/system/$username.service > /dev/null
        sudo systemctl daemon-reload
        sudo systemctl enable --now "$username.service"
        echo "Service file created and enabled successfully!"
    fi
}

echo "Installing dependencies (only Vintage Story for now!)"
sudo pacman -S --noconfirm bc curl gzip jq tar tmux unzip wget steam aspnet-runtime-7.0

echo "Configuring UFW"
port=$(get_required_input "What's the port this game has to run on?")
sudo ufw allow $port/tcp

echo "Adding and setting up LinuxGSM user"
username=$(get_required_input "Enter the username")
add_and_setup_linuxgsm_user "$username"
