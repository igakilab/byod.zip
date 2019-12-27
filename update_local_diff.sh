#/bin/bash

INSTALLED=/C/oit/java/PortableGit-2.24.1.2-64
INSTALLED_ETC=${INSTALLED}/etc/
INSTALLED_BIN=${INSTALLED}/usr/local/bin/

REPO=./PortableGit
REPO_ETC=${REPO}/etc/
REPO_BIN=${REPO}/usr/local/bin/

function ConfirmExecution() {

  echo "----------------------------"
  echo "テスト環境(${INSTALLED})からリポジトリに同期しますか?"
  echo "  実行する場合は yes、実行をキャンセルする場合は no と入力して下さい."
  read input

  if [ -z $input ] ; then

    echo "  yes または no を入力して下さい."
    ConfirmExecution

  elif [ $input = 'yes' ] || [ $input = 'YES' ] || [ $input = 'y' ] ; then

    echo "  同期を実行します."
    UpdateVersionNumber local
    RsyncEnvironment ${INSTALLED_ETC} ${REPO_ETC}
    RsyncEnvironment ${INSTALLED_BIN} ${REPO_BIN}

  elif [ $input = 'no' ] || [ $input = 'NO' ] || [ $input = 'n' ] ; then

    echo "  同期を実行しません."

  else

    echo "  yes または no を入力して下さい."
    ConfirmExecution

  fi

}
function RsyncEnvironment() {
  echo "$1から$2への同期を行います"
  rsync -avu \
        --exclude='bash.bash_logout'  \
        --exclude='bash.bashrc'  \
        --exclude='DIR_COLORS'  \
        --exclude='docx2txt.config'  \
        --exclude='fstab'  \
        --exclude='hosts'  \
        --exclude='inputrc'  \
        --exclude='msystem'  \
        --exclude='mtab'  \
        --exclude='nanorc'  \
        --exclude='networks'  \
        --exclude='package-versions.txt'  \
        --exclude='pkcs11'  \
        --exclude='pki'  \
        --exclude='protocols'  \
        --exclude='services'  \
        --exclude='ssh'  \
        --exclude='tigrc'  \
        --exclude='vimrc'  \
        $1 $2

}

function CheckDiff() {
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
             -v -e vimrc"

diff -r ${INSTALLED_ETC} ${REPO_ETC} | grep ${ETC_IGNORED}
diff ${INSTALLED_BIN} ${REPO_BIN}
}

# arg $1 is local or java
function UpdateVersionNumber() {
  echo "getversionを更新します"
  sed -i -E "s/$1env-[0-9]{12}/$1env-`date "+%Y%m%d%H%M"`/g" ${INSTALLED_BIN}getversion
  sed -i -E "s/$1env-[0-9]{8}/$1env-`date "+%Y%m%d"`/g" ${INSTALLED_BIN}getversion
}

CheckDiff
ConfirmExecution
