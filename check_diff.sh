#/bin/sh

INSTALLED_ETC=/C/oit/PortableGit-2.21.0-64/etc/
INSTALLED_PROF=/C/oit/PortableGit-2.21.0-64/etc/profile.d/
INSTALLED_BIN=/C/oit/PortableGit-2.21.0-64/usr/local/bin/

ETC_IGNORED="-v -e bash.bash_logout
             -v -e bash.bashrc
             -v -e DIR_COLORS
             -v -e docx2txt.config
             -v -e fstab
             -v -e hosts
             -v -e inputrc
             -v -e msystem
             -v -e mtab
             -v -e nanorc
             -v -e networks
             -v -e package-versions.txt
             -v -e pkcs11
             -v -e pki
             -v -e protocols
             -v -e services
             -v -e ssh
             -v -e tigrc
             -v -e profile
             -v -e vimrc"

diff ${INSTALLED_ETC} ./PortableGit/etc/ | grep ${ETC_IGNORED}
diff ${INSTALLED_PROF} ./PortableGit/etc/profile.d/
diff ${INSTALLED_BIN} ./PortableGit/usr/local/bin/