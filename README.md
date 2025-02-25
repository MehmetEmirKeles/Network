Network Security Tools

A collection of useful scripts designed to automate network security tasks. This repository contains scripts for various security-related tasks, enabling network administrators, security professionals, and anyone interested in network security to effectively automate and manage security measures.

Before You Begin: What Does This Project Do?

As you know, we live in an era where we are still exposed to risks such as theft of our personal information, unauthorized access to our data, and violations of our privacy rights. While using the internet has become a necessity, it often comes with these risks. The goal of this project is to help keep your information secure while using public internet networks and protect you from various types of attacks. So, how does this project protect us from attacks?
1. What is a MITM (Man-in-the-Middle) Attack?

A MITM attack occurs when a hacker secretly intercepts or manipulates communication between you and another party (e.g., a website or another user). Think of it like this: Two people are exchanging letters, but the letters are handed to a courier. In a MITM attack, the hacker replaces the courier, reads the letters, and can even alter their content. This is especially easy to do over unencrypted or insecure connections (like HTTP). For example, when you connect to a café's Wi-Fi, a hacker can position themselves between you and the internet, stealing your passwords, banking information, or personal data.
2. What Does a Firewall Do?

A firewall acts as a barrier between your computer or network and the outside world (the internet). Its primary purpose is to prevent unauthorized individuals or malicious software from accessing your system. Think of it as a security guard at your front door. It decides who can enter and who can leave. For example, if a hacker attempts a MITM attack, the firewall can block such suspicious connections and protect you.
3. Information Theft Through Packet Sniffing (e.g., Wireshark)

Packet sniffing is the process of capturing and analyzing data packets sent over a network. Tools like Wireshark are used to view these packets. Normally, these tools are used to troubleshoot network issues, but malicious actors can also use them to steal your information. For instance, when you're on the same network as a hacker (e.g., on a public Wi-Fi), they can use a tool like Wireshark to capture the data you send (passwords, emails, messages). If this data is unencrypted (using HTTP instead of HTTPS), the hacker can easily read and misuse it.


Step 1: Pre-Installation Steps

Before you can start using the tools in this project, make sure your system is up-to-date and has all the necessary dependencies installed.
Update your system
Update the package lists for the latest available versions of the software:
```
sudo apt update
```
Upgrade your system
Install the latest updates for your installed software:
```
sudo apt upgrade
```
nstall Git
Git is necessary for cloning the repository. Install it with the following command:
```
sudo apt install git
```
Install Curl
Curl is used to download files over the internet. Install it by running:

```
sudo apt install curl
```
Install Python 3 (if needed for certain functionalities)
Python 3 may be required for certain advanced features of the tools:
```
sudo apt install python3
```
Install Bash (if not already installed)
The scripts in this project are designed for Bash. Usually, Bash is pre-installed on most Linux systems, but you can ensure it's installed with:
```
sudo apt install bash
```
This project is designed to help with network security automation tasks. Installation & Setup Step 2: Clone the Repository

You can clone the repository using the following command:
```
git clone https://github.com/MehmetEmirKeles/Network.git
```

Step 3: Navigate to the Project Folder

Once the repository is cloned, navigate to the project directory:
```
cd Network
```

This will ensure that all the dependencies and tools are installed correctly. Scripts Available in the Repository
```
emirkeles.sh:
```
The main script for network security tasks. This script will help automate common network security processes.
```
emirkeleseng.sh:
```
The English version of the emirkeles.sh script. This provides the same functionality, but in English for wider accessibility.

Usage
Once the setup is complete, you can begin using the scripts. Here's how you can run the main security script:
```
bash emirkeles.sh
```
For the English version, you can run:
```
bash emirkeleseng.sh
```
Features

Automated network security tasks.
Easy-to-use scripts for quick implementation.
Both English and Turkish versions of the scripts available.

Contributing

If you'd like to contribute to this project, feel free to fork the repository, make changes, and submit a pull request. Contributions are always welcome! Links

Project Repository: 
```
https://github.com/MehmetEmirKeles/Network
```
Direct Download Link: 
```
Download Network-Security Tools
```

 *Türkçe Açıklama (Optional for Turkish Users) Proje Kurulumu*

Network Security Tools - Ağ Güvenliği Araçları

Ağ güvenliği görevlerini otomatikleştirmek için tasarlanmış faydalı script'lerin bir koleksiyonu. Bu depo, çeşitli güvenlik ile ilgili görevler için script'ler içeriyor, böylece ağ yöneticileri, güvenlik profesyonelleri ve ağ güvenliği ile ilgilenen herkes güvenlik önlemlerini etkili bir şekilde otomatikleştirip yönetebilir.

Başlamadan Önce Bu Proje Ne İşe Yarar?

Bildiğiniz üzere günümüzde hala maruz kaldığımız bilgilerimizin çalınması, istemediğimiz kişilerin eline geçmesi, kişisel hak ve gizliliklerimizin işgal edildiği, internet ağının içinde bulunmamız zorunlu olan ama bulunurken başımıza bunların gelebildiği bir çağdayız. benim bu projedeki amacım en azından bizi herkese açık ortamlardaki internet ağını kullanırken kendi bilgilerimizi güvende tutabilmek ve çeşitli saldırılardan koruyabilmek. Peki bu proje bizi nasıl saldırılardan koruyor?

1. MITM (Man-in-the-Middle) Saldırısı Nedir?

MITM saldırısı, bir hacker'ın sizinle (örneğin bir web sitesi veya başka bir kullanıcıyla) aranızdaki iletişimi gizlice dinlemesi veya manipüle etmesidir. Şöyle düşün: İki kişi birbirine mektup yazıyor, ancak bu mektuplar postacıya veriliyor. MITM saldırısında, hacker bu postacının yerine geçer ve mektupları okur, hatta içeriğini değiştirebilir. Bu, özellikle şifresiz veya güvenli olmayan bağlantılarda (HTTP gibi) kolayca yapılabilir. Örneğin, bir kafe Wi-Fi'sine bağlandığınızda, hacker sizinle internet arasına girerek şifrelerinizi, banka bilgilerinizi veya kişisel verilerinizi çalabilir.

2. Firewall (Güvenlik Duvarı) Ne İşe Yarar?

Firewall, bilgisayarınız veya ağınız ile dış dünya (internet) arasında bir güvenlik duvarı gibi çalışır. Temel amacı, yetkisiz kişilerin veya zararlı yazılımların sisteminize erişmesini engellemektir. Şöyle düşün: Firewall, evinizin kapısındaki bir güvenlik görevlisi gibidir. Kimin içeri gireceğine, kimin dışarı çıkacağına karar verir. Örneğin, bir hacker MITM saldırısı yapmaya çalıştığında, firewall bu tür şüpheli bağlantıları engelleyebilir ve sizi koruyabilir.

3. Paket İzleme Yöntemiyle Bilgilerin Çalınması (Wireshark Gibi)

Paket izleme, ağ üzerinden gönderilen veri paketlerini yakalayıp analiz etme işlemidir. Wireshark gibi araçlar, bu paketleri görüntülemek için kullanılır. Normalde bu araçlar, ağ sorunlarını çözmek için kullanılır, ancak kötü niyetli kişiler bu araçları bilgilerinizi çalmak için de kullanabilir. Örneğin, bir hacker, aynı ağda bulunduğunuzda (örneğin bir halka açık Wi-Fi'de) Wireshark gibi bir araçla sizin gönderdiğiniz verileri (şifreler, e-postalar, mesajlar) yakalayabilir. Eğer bu veriler şifrelenmemişse (HTTPS yerine HTTP kullanıyorsanız), hacker bu bilgileri kolayca okuyabilir ve kötüye kullanabilir.

Proje Kurulumu
Projeye başlamak için depodan bilgileri almalı ve kurulum talimatlarını takip etmelisiniz.

Bu projedeki araçları kullanmaya başlamadan önce, sisteminizin güncel olduğundan ve gerekli tüm araçların yüklü olduğundan emin olun.

-Adım 1: Kurulum Öncesi Adımlar-

+Sisteminizi güncelleyin
-Yazılımın en son sürümleri için paket listelerini güncelleyin:
```
sudo apt update
```
+Sisteminizi yükseltin
-Yüklü yazılımlarınız için en son güncellemeleri yükleyin:
```
sudo apt upgrade
```
+Git'i yükleyin
-Git, depo verilerini almak için gereklidir. Aşağıdaki komutla yükleyebilirsiniz:
```
sudo apt install git
```
+Curl'ü yükleyin
-Curl, internet üzerinden dosya indirmek için kullanılır. Aşağıdaki komutla yükleyebilirsiniz:
```
sudo apt install curl
```
+Python 3 yükleyin (bazı fonksiyonellikler için gerekebilir)
-Python 3, araçların bazı gelişmiş özellikleri için gerekebilir:
```
sudo apt install python3
```
+Bash'i yükleyin (eğer zaten yüklü değilse)
-Bu projedeki script'ler Bash için tasarlanmıştır. Çoğu Linux sisteminde Bash önceden yüklü olsa da, aşağıdaki komutla yüklendiğinden emin olabilirsiniz:
```
sudo apt install bash
```
Bu proje, ağ güvenliği otomasyon görevleriyle ilgili yardımcı olmak için tasarlanmıştır.

-Adım 2: Depodan verileri alın-

Depodan verileri şu komutla çekebilirsiniz. :
```
git clone https://github.com/MehmetEmirKeles/Network.git
```
-Adım 3: Proje Klasörüne Geçin-

Depodan verileri aldıntan sonra sonra proje dizinine geçin:
```
cd Network
```
Mevcut Script'ler
````
emirkeles.sh:
````
Ağ güvenliği görevleri için ana script. Bu script, yaygın ağ güvenliği süreçlerini otomatikleştirmeye yardımcı olacaktır.
```
   emirkeleseng.sh:
```
   cript'inin İngilizce versiyonu. Aynı işlevselliği sağlar ancak daha geniş erişilebilirlik için İngilizce olarak sunulmuştur.
Kullanım
````
   emirkeles.shemirkeles.sh: Ağ güvenliği görevleri için ana script. Bu script, yaygın ağ güvenliği süreçlerini otomatikleştirmeye yardımcı olacaktır.
````
Kurulum tamamlandığında, script'leri kullanmaya başlayabilirsiniz. İşte ana güvenlik script'ini çalıştırma yolu:
```
bash emirkeles.sh
```
İngilizce versiyon için:
```
bash emirkeleseng.sh
```
Özellikler

Ağ güvenliği görevlerinin otomatikleştirilmesi
Hızlı uygulama için kolay kullanımlı script'ler
Hem Türkçe hem de İngilizce versiyonlar mevcuttur


Proje Deposu:
```
https://github.com/MehmetEmirKeles/Network
````
Direkt İndirme Linki:
```
Download Network-Security Tools
```
