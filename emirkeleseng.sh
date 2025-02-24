#!/bin/bash
# This script brings the functionality of your Python code to the bash environment.
# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

# Global PID variables
mitm_pid=""
tracking_pid=""

# Banner display (used if figlet is installed)
big_welcome() {
    if command -v figlet >/dev/null 2>&1; then
        figlet "WELCOME TO EMIR SECURITY"
    else
        echo "WELCOME TO EMIR SECURITY"
    fi
    echo -e "${GREEN}MEK - Security Tool${RESET}"
}

# Main menu function
main_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}1. Firewall"
        echo -e "${CYAN}2. MITM Attack"
        echo -e "${CYAN}3. Package Tracking"
        echo -e "${CYAN}4. Exit${RESET}"
        read -p $'\nMake your selection (1/2/3/4): ' choice
        case $choice in
            1) firewall_menu ;;
            2) mitm_menu ;;
            3) packet_tracking_menu ;;
            4) exit_program ;;
            *) echo -e "${RED}Invalid selection, please try again."
               read -p "Press Enter to continue..." ;;
        esac
    done
}

# Firewall menu
firewall_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}Firewall Options:"
        echo -e "${CYAN}1. Enable Firewall"
        echo -e "${CYAN}2. Disable Firewall"
        echo -e "${CYAN}3. Return to Main Menu"
        echo -e "${CYAN}4. Exit${RESET}"
        read -p $'\nMake your selection (1/2/3/4): ' choice
        case $choice in
            1) enable_firewall ;;
            2) disable_firewall ;;
            3) return ;;
            4) exit_program ;;
            *) echo -e "${RED}Invalid selection, please try again."
               read -p "Press Enter to continue..." ;;
        esac
    done
}

# MITM menu
mitm_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}MITM Attack Options:"
        echo -e "${CYAN}1. Start MITM attack (start monitoring)"
        echo -e "${CYAN}2. Stop MITM attack (stop monitoring)"
        echo -e "${CYAN}3. Return to Main Menu"
        echo -e "${CYAN}4. Exit${RESET}"
        read -p $'\nSelect an option (1/2/3/4): ' choice
        case $choice in
            1)
                if [ -z "$mitm_pid" ]; then
                    start_mitm_monitoring
                else
                    echo -e "${YELLOW}MITM monitoring is already running."
                    read -p "Press Enter to continue..."
                fi
                ;;
            2)
                if [ -n "$mitm_pid" ]; then
                    stop_mitm_monitoring
                else
                    echo -e "${YELLOW}MITM monitoring is not running."
                    read -p "Press Enter to continue..."
                fi
                ;;
            3)
                if [ -n "$mitm_pid" ]; then
                    stop_mitm_monitoring
                fi
                return
                ;;
            4) exit_program ;;
            *)
                echo -e "${RED}Invalid selection, please try again."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Package Tracking menu
packet_tracking_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}Package Tracking Options:"
        echo -e "${CYAN}1. Start packet tracking"
        echo -e "${CYAN}2. Stop packet tracking"
        echo -e "${CYAN}3. Return to Main Menu"
        echo -e "${CYAN}4. Exit${RESET}"
        read -p $'\nSelect an option (1/2/3/4): ' choice
        case $choice in
            1)
                if [ -z "$tracking_pid" ]; then
                    start_packet_tracking
                else
                    echo -e "${YELLOW}Packet tracking is already running."
                    read -p "Press Enter to continue..."
                fi
                ;;
            2)
                if [ -n "$tracking_pid" ]; then
                    stop_packet_tracking
                else
                    echo -e "${YELLOW}Packet tracking is not running."
                    read -p "Press Enter to continue..."
                fi
                ;;
            3)
                if [ -n "$tracking_pid" ]; then
                    stop_packet_tracking
                fi
                return
                ;;
            4) exit_program ;;
            *)
                echo -e "${RED}Invalid selection, please try again."
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Enable firewall function
enable_firewall() {
    echo -e "${GREEN}\nEnabling firewall..."
    sudo ufw enable
    echo -e "${GREEN}Firewall successfully enabled!"
    read -p "Press Enter to return to the main menu..."
}

# Disable firewall function
disable_firewall() {
    echo -e "${GREEN}\nDisabling firewall..."
    sudo ufw disable
    echo -e "${GREEN}Firewall successfully disabled!"
    read -p "Press Enter to return to the main menu..."
}

# Start MITM monitoring
start_mitm_monitoring() {
    echo -e "${GREEN}\nStarting MITM monitoring..."
    mitm_loop &
    mitm_pid=$!
    echo -e "${GREEN}MITM monitoring started."
    read -p "Press Enter to return to the menu..."
}

# MITM loop function (runs in the background)
mitm_loop() {
    while true; do
        echo -e "${YELLOW}\nScanning for MITM attacks..."
        detect_mitm
        sleep 10
    done
}

# Stop MITM monitoring
stop_mitm_monitoring() {
    if [ -n "$mitm_pid" ]; then
        kill $mitm_pid 2>/dev/null
        wait $mitm_pid 2>/dev/null
        mitm_pid=""
        echo -e "${RED}\nMITM monitoring stopped."
    else
        echo -e "${YELLOW}\nMITM monitoring is not running."
    fi
    read -p "Press Enter to continue..."
}

# MITM detection (ARP query)
detect_mitm() {
    echo -e "${YELLOW}Checking ARP cache for MITM indicators..."
    if command -v arp-scan >/dev/null 2>&1; then
        sudo arp-scan --localnet
    else
        arp -a
    fi
    echo -e "${GREEN}No obvious MITM attack detected.${RESET}"
}

# Start packet tracking
start_packet_tracking() {
    echo -e "${GREEN}\nStarting packet tracking..."
    tracking_loop &
    tracking_pid=$!
    echo -e "${GREEN}Packet tracking started."
    read -p "Press Enter to return to the menu..."
}

# Packet tracking loop function (runs in the background)
tracking_loop() {
    while true; do
        echo -e "${YELLOW}\nSending ping to 8.8.8.8..."
        if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
            echo -e "${GREEN}Received expected response from 8.8.8.8"
        else
            echo -e "${RED}No response from 8.8.8.8"
        fi
        sleep 10
    done
}

# Stop packet tracking
stop_packet_tracking() {
    if [ -n "$tracking_pid" ]; then
        kill $tracking_pid 2>/dev/null
        wait $tracking_pid 2>/dev/null
        tracking_pid=""
        echo -e "${RED}\nPacket tracking stopped."
    else
        echo -e "${YELLOW}\nPacket tracking is not running."
    fi
    read -p "Press Enter to continue..."
}

# Exit function; stops background processes.
exit_program() {
    if [ -n "$mitm_pid" ]; then
        kill $mitm_pid 2>/dev/null
        wait $mitm_pid 2>/dev/null
    fi
    if [ -n "$tracking_pid" ]; then
        kill $tracking_pid 2>/dev/null
        wait $tracking_pid 2>/dev/null
    fi
    echo -e "${RED}\nExiting..."
    exit 0
}

# Program start
main_menu
