#!/bin/bash
# 這是我設定 我的debugger
# HW: rpi2
# OS: ubuntu server 20.04.2 32-bit
#  (Note: 不要使用升級的方式 超久的)
#
#
# after install: 
# defualt user name / password
#            ubuntu / ubuntu
#
# defualt host name: ubuntu
#
#

########### default configure ##############################
CFG_HOSTNAME=rdbger
CFG_TFTP_ROOT=/home/tftp
CFG_TIMEZONE=Asia/Taipei
########### end of default configure #######################


fn_error_happen()
{
    echo "====================================================="
    echo "===Error Error Error error error Error Error Error==="
    echo "====================================================="
    echo "==$1  "
    echo "====================================================="
    sleep 5
    echo "Exiting..."
    exit 1;
}

fn_echo_process()
{
    echo "====================================================="
    echo "==$1 "
}


fn_change_hostname()
{
    fn_echo_process "Change Hostname"
    sudo hostnamectl set-hostname $CFG_HOSTNAME
}

fn_enable_ssh_server()
{
    fn_echo_process "Enable SSH server"
    sudo apt -y install openssh-server
}

fn_enable_minicom_server()
{
    fn_echo_process "Enable minicom server"
    sudo apt -y install minicom pv
    test -f /usr/bin/bin-xfer
    if [ $? == 1 ]; then
        wget http://dev.laptop.org/~wad/bin-xfer
        [ $? -ne 0 ] && fn_error_happen "wget bin-xfer"
                chmod 755 bin-xfer
                sudo chown root:root bin-xfer
                sudo mv bin-xfer /usr/bin
        fi
}

fn_enable_tftp_server()
{
    fn_echo_process "Enable tftp server"
    sudo apt -y install tftp-hpa
    test -e $CFG_TFTP_ROOT
    if [ $? == 1 ]; then
        echo "******** tftp folder $CFG_TFTP_ROOT ********"
        sudo mkdir $CFG_TFTP_ROOT
        sudo chown -R nobody:nogroup $CFG_TFTP_ROOT
        sudo bash -c 'echo "# /etc/default/tftpd-hpa" > /etc/default/tftpd-hpa'
        sudo bash -c 'echo "" >> /etc/default/tftpd-hpa'
        sudo bash -c 'echo "TFTP_USERNAME=\"tftp\"" >> /etc/default/tftpd-hpa'
        sudo bash -c 'echo "TFTP_DIRECTORY=\"$CFG_TFTP_ROOT\"" >> /etc/default/tftpd-hpa'
        sudo bash -c 'echo "TFTP_ADDRESS=\"0.0.0.0:69\"" >> /etc/default/tftpd-hpa'
        sudo bash -c 'echo "TFTP_OPTIONS=\"-l -c -s\"" >> /etc/default/tftpd-hpa'
        sudo bash -c 'echo "" >> /etc/default/tftpd-hpa'
        sudo service tftpd-hpa restart
    fi    
}

fn_set_timezone()
{
    fn_echo_process "Set timezone $CFG_TIMEZONE"
    sudo timedatectl set-timezone $CFG_TIMEZONE
    timedatectl
}

fn_install_ipmitool()
{
    fn_echo_process "Install ipmitool"
    sudo apt -y install dmidecode
	sudo apt -y install ipmitool
	[ $? -ne 0 ] && fn_error_happen "fn_install_ipmitool"
	dmidecode | grep "DMI type 38"
	if [ $? == 0 ]; then
        sudo modprobe ipmi_devintf
        sudo modprobe ipmi_si
        cat /etc/modules | grep ipmi_devintf
        if [ $? != 0 ]; then
            sudo bash -c 'echo "ipmi_devintf" >> /etc/modules'
        fi
        
        cat /etc/modules | grep ipmi_si
        if [ $? != 0 ]; then
            sudo bash -c 'echo "ipmi_si" >> /etc/modules'
        fi
    fi
}



