tempdir="/home/teachers/t2015025/byod"
rm -rf ~/public_html/progjava/local/bin/*
rm -rf ~/public_html/progjava/etc/*
mkdir ${tempdir} && git -C ${tempdir} init
git -C ${tempdir} config core.sparsecheckout true
git -C ${tempdir} remote add origin https://github.com/igakilab/byod.zip.git
echo /PortableGit/usr/local/bin/ > ${tempdir}/.git/info/sparse-checkout
echo /PortableGit/etc/ >> ${tempdir}/.git/info/sparse-checkout
git -C ${tempdir} pull origin master
mv ${tempdir}/PortableGit/usr/local/bin/ ~/public_html/progjava/local/
mv ${tempdir}/PortableGit/etc/profile.d/ ~/public_html/progjava/etc/
rm -rf ${tempdir}
chmod 755 -R ~/public_html/progjava/local/
chmod 755 -R ~/public_html/progjava/etc/
find ~/public_html/progjava/local/ -type f -print | xargs chmod 644
find ~/public_html/progjava/etc/ -type f -print | xargs chmod 644