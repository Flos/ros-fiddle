#!/bin/bash
cat << EOT >> eclipse.desktop
[Desktop Entry]
Name=Eclipse
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE
Name[en]=eclipse.desktop
EOT
echo "created eclipse file"
sudo mv eclipse.desktop /usr/share/applications/eclipse.desktop
echo "ende"
