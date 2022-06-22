# The file that actually contains all of the commands to run things
import subprocess
from software import software
from systemd import systemd

# Function to run a shell command
def run_command(command):
    process = subprocess.run(command.split(" "))
    return process

# Install yay to install everything else
def install_yay():
    url = "https://aur.archlinux.org/yay.git"
    # Make sure that git is installed
    return run_command(f"cd; git clone {url}; cd yay; makepkg -si; cd")


# Uses yay to install everyting in software
def install_software():
    packages = ""
    for package in software:
        packages = packages + package + " "

    return run_command(f"yay -S {packages}")

# Command used to start/enable systemd services
def systemd_init():
    process = ""
    for unit in systemd:
        if unit[1] == "enabled":
            process += str(run_command(f"sudo systemctl enable {unit[0]}"))

        if unit[2] == "start":
            process += str(run_command(f"sudo systemctl start {unit[0]}"))

    return process

# Copy all software from local repo to correct system location
def link_files(source, destination):
    return run_command(f"ln -f {source} {destination}")
