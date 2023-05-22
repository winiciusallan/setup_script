#!/bin/bash

function configure_root_loginssh() {
    # Get exactly the number of the line to be edited
    line=$(cat /etc/ssh/sshd_config | grep -n prohibit)
    line=${line::2}
    sed -i "$line s/^#//" /etc/ssh/sshd_config 
}
function command_permission() {
    chown root:adm /usr/bin/su
    chown root:adm /usr/bin/login
    chmod 770 /usr/bin/su
    chmod 770 /usr/bin/login
}

function configure_lightdm() {
    CONFIG_FILE="/etc/lightdm/lightdm.conf"
    config="[Seat:*]
greeter-show-manual-login=true
greeter-hide-users=true"
    echo -e "$config" >> $CONFIG_FILE 
}

function configure_background() {
    BACKGROUND_FILE="BACKGROUND_PATH"
    
    sed -i "s|^#background=|background=$BACKGROUND_FILE|" /etc/lightdm/lightdm-gtk-greeter.conf
}

configure_root_loginssh() {

}
