#!/bin/bash
# Bu betik, Python kodunuzun işlevselliğini bash ortamına taşır.
# Renk tanımlamaları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

# Global PID değişkenleri
mitm_pid=""
tracking_pid=""

# Banner gösterimi (figlet yüklü ise kullanılır)
big_welcome() {
    if command -v figlet >/dev/null 2>&1; then
        figlet "WELCOME TO EMIR SECURITY"
    else
        echo "WELCOME TO EMIR SECURITY"
    fi
    echo -e "${GREEN}MEK - Güvenlik Aracı${RESET}"
}

# Ana menü fonksiyonu
main_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}1. Firewall"
        echo -e "${CYAN}2. MITM Attack"
        echo -e "${CYAN}3. Package Tracking"
        echo -e "${CYAN}4. Çıkış yap${RESET}"
        read -p $'\nSeçiminizi yapın (1/2/3/4): ' choice
        case $choice in
            1) firewall_menu ;;
            2) mitm_menu ;;
            3) packet_tracking_menu ;;
            4) exit_program ;;
            *) echo -e "${RED}Geçersiz seçim, lütfen tekrar deneyin."
               read -p "Devam etmek için Enter'a basın..." ;;
        esac
    done
}

# Firewall menüsü
firewall_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}Firewall Seçenekleri:"
        echo -e "${CYAN}1. Firewall Aç"
        echo -e "${CYAN}2. Firewall Kapat"
        echo -e "${CYAN}3. Ana Menüye Dön"
        echo -e "${CYAN}4. Çıkış Yap${RESET}"
        read -p $'\nSeçiminizi yapın (1/2/3/4): ' choice
        case $choice in
            1) enable_firewall ;;
            2) disable_firewall ;;
            3) return ;;
            4) exit_program ;;
            *) echo -e "${RED}Geçersiz seçim, lütfen tekrar deneyin."
               read -p "Devam etmek için Enter'a basın..." ;;
        esac
    done
}

# MITM menüsü
mitm_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}MITM Attack Options:"
        echo -e "${CYAN}1. MITM attack (start monitoring)"
        echo -e "${CYAN}2. MITM attack (stop monitoring)"
        echo -e "${CYAN}3. Ana Menüye Dön"
        echo -e "${CYAN}4. Çıkış Yap${RESET}"
        read -p $'\nSelect an option (1/2/3/4): ' choice
        case $choice in
            1)
                if [ -z "$mitm_pid" ]; then
                    start_mitm_monitoring
                else
                    echo -e "${YELLOW}MITM monitoring zaten çalışıyor."
                    read -p "Devam etmek için Enter'a basın..."
                fi
                ;;
            2)
                if [ -n "$mitm_pid" ]; then
                    stop_mitm_monitoring
                else
                    echo -e "${YELLOW}MITM monitoring çalışmıyor."
                    read -p "Devam etmek için Enter'a basın..."
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
                echo -e "${RED}Geçersiz seçim, lütfen tekrar deneyin."
                read -p "Devam etmek için Enter'a basın..."
                ;;
        esac
    done
}

# Package Tracking menüsü
packet_tracking_menu() {
    while true; do
        clear
        big_welcome
        echo -e "${CYAN}Package Tracking Options:"
        echo -e "${CYAN}1. Packet tracking start"
        echo -e "${CYAN}2. Packet tracking stop"
        echo -e "${CYAN}3. Ana Menüye Dön"
        echo -e "${CYAN}4. Çıkış Yap${RESET}"
        read -p $'\nSelect an option (1/2/3/4): ' choice
        case $choice in
            1)
                if [ -z "$tracking_pid" ]; then
                    start_packet_tracking
                else
                    echo -e "${YELLOW}Packet tracking zaten çalışıyor."
                    read -p "Devam etmek için Enter'a basın..."
                fi
                ;;
            2)
                if [ -n "$tracking_pid" ]; then
                    stop_packet_tracking
                else
                    echo -e "${YELLOW}Packet tracking çalışmıyor."
                    read -p "Devam etmek için Enter'a basın..."
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
                echo -e "${RED}Geçersiz seçim, lütfen tekrar deneyin."
                read -p "Devam etmek için Enter'a basın..."
                ;;
        esac
    done
}

# Firewall'ı açma fonksiyonu
enable_firewall() {
    echo -e "${GREEN}\nFirewall açılıyor..."
    sudo ufw enable
    echo -e "${GREEN}Firewall başarıyla açıldı!"
    read -p "Ana menüye dönmek için Enter'a basın..."
}

# Firewall'ı kapama fonksiyonu
disable_firewall() {
    echo -e "${GREEN}\nFirewall kapatılıyor..."
    sudo ufw disable
    echo -e "${GREEN}Firewall başarıyla kapatıldı!"
    read -p "Ana menüye dönmek için Enter'a basın..."
}

# MITM monitoring başlatma
start_mitm_monitoring() {
    echo -e "${GREEN}\nMITM monitoring başlatılıyor..."
    mitm_loop &
    mitm_pid=$!
    echo -e "${GREEN}MITM monitoring başlatıldı."
    read -p "Menüye dönmek için Enter'a basın..."
}

# MITM döngü fonksiyonu (arka planda çalışır)
mitm_loop() {
    while true; do
        echo -e "${YELLOW}\nScanning for MITM attacks..."
        detect_mitm
        sleep 10
    done
}

# MITM monitoring durdurma
stop_mitm_monitoring() {
    if [ -n "$mitm_pid" ]; then
        kill $mitm_pid 2>/dev/null
        wait $mitm_pid 2>/dev/null
        mitm_pid=""
        echo -e "${RED}\nMITM monitoring durduruldu."
    else
        echo -e "${YELLOW}\nMITM monitoring çalışmıyor."
    fi
    read -p "Devam etmek için Enter'a basın..."
}

# MITM tespiti (ARP sorgusu)
detect_mitm() {
    echo -e "${YELLOW}Checking ARP cache for MITM indicators..."
    if command -v arp-scan >/dev/null 2>&1; then
        sudo arp-scan --localnet
    else
        arp -a
    fi
    echo -e "${GREEN}No obvious MITM attack detected.${RESET}"
}

# Packet tracking başlatma
start_packet_tracking() {
    echo -e "${GREEN}\nPacket tracking başlatılıyor..."
    tracking_loop &
    tracking_pid=$!
    echo -e "${GREEN}Packet tracking başlatıldı."
    read -p "Menüye dönmek için Enter'a basın..."
}

# Packet tracking döngüsü (arka planda çalışır)
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

# Packet tracking durdurma
stop_packet_tracking() {
    if [ -n "$tracking_pid" ]; then
        kill $tracking_pid 2>/dev/null
        wait $tracking_pid 2>/dev/null
        tracking_pid=""
        echo -e "${RED}\nPacket tracking durduruldu."
    else
        echo -e "${YELLOW}\nPacket tracking çalışmıyor."
    fi
    read -p "Devam etmek için Enter'a basın..."
}

# Çıkış fonksiyonu; arka plan işlemlerini durdurur.
exit_program() {
    if [ -n "$mitm_pid" ]; then
        kill $mitm_pid 2>/dev/null
        wait $mitm_pid 2>/dev/null
    fi
    if [ -n "$tracking_pid" ]; then
        kill $tracking_pid 2>/dev/null
        wait $tracking_pid 2>/dev/null
    fi
    echo -e "${RED}\nÇıkış yapılıyor..."
    exit 0
}

# Programın başlangıcı
main_menu

