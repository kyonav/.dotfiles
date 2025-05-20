# dell_smm max fan speed and turbo boost always

# Warning
echo "You need to manually add 'intel_pstate' to your kernel parameters"
echo "You have to enable Intel Turbo Boost and SpeedStep on the bios"
read

# 1 - Install i8kutils, tcllib and dell-bios-fan-control-git from aur
cd ; mkdir tttemp992 ; cd tttemp992
git clone https://aur.archlinux.org/i8kutils ; cd i8kutils
makepkg --noconfirm -f 

cd ../ ; git clone https://aur.archlinux.org/tcllib ; cd tcllib 
makepkg --noconfirm -f

cd ../ ; git clone https://aur.archlinux.org/dell-bios-fan-control-git
cd dell-bios-fan-control-git ; makepkg --noconfirm -f ; cd

# 2 - Install acpi and tcl from pacman
sudo pacman -Syu acpi tcl --noconfirm

# 3 = Add necessary modules ->
echo -e "i8kutils\ndell_smm_hwmon" | sudo tee -a /etc/modules > /dev/null

# 4 - Add this kernel parameter to use the acpi-cpufreq ->
# intel_pstate=disable

# 5 - Create a service to automate the process ->
sudo tee /etc/systemd/system/dell_max_fanNcpufreq.service > /dev/null << 'EOF'
[Unit]
Description=Set fan1 and cpufrex to max

[Service]
ExecStart=/usr/bin/dell-bios-fan-control 0
ExecStart=/usr/bin/i8kctl fan1 2
ExecStart=/usr/bin/cpupower frequency-set -g performance
Type=oneshot

[Install]
WantedBy=multi-user.target
EOF

# 6 - Delete temp folder
cd; rm -rf tttemp992

# 8 - Enable the created service 
sudo systemctl enable dell_max_fanNcpufreq.service

# 9 - Reboot to load added modules and start the service
sudo reboot
