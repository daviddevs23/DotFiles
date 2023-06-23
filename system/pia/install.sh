#!/bin/bash

yay -S sed
sudo sed -i "s|/opt/piavpn/bin/pia-client |env QT_QPA_PLATFORM=xcb /opt/piavpn/bin/pia-client|g" /usr/share/applications/piavpn.desktop
