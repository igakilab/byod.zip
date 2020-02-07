tempdir="/home/teachers/t2015025/byod"
dirdate=20200101

#rm -rf ~/public_html/progjava/local/bin/*
#rm -rf ~/public_html/progjava/etc/*
mkdir ${tempdir} && git -C ${tempdir} init
git -C ${tempdir} config core.sparsecheckout true
git -C ${tempdir} remote add origin https://github.com/igakilab/byod.zip.git
echo /PortableGit/usr/local/bin/ > ${tempdir}/.git/info/sparse-checkout
echo /PortableGit/etc/ >> ${tempdir}/.git/info/sparse-checkout
git -C ${tempdir} pull origin master

cd ${tempdir}/PortableGit
for FILE in `git ls-files`; do
  TIME=`git log --pretty=format:%ci -n1 $FILE`
  echo $TIME'\t'$FILE
  STAMP=`date -d "$TIME" +"%y%m%d%H%M.%S"`
  touch -t $STAMP $FILE
done

find ~/byod/PortableGit/ -type d | xargs touch -d ${dirdate}

mkdir -p ~/public_html/progjava/local/
rsync --checksum -av --delete \
      --chmod=D755,F644   \
      ${tempdir}/PortableGit/usr/local/bin ~/public_html/progjava/local/

rsync --checksum -av --delete \
      --chmod=D755,F644   \
      ${tempdir}/PortableGit/etc/profile.d ~/public_html/progjava/etc/

#mv ${tempdir}/PortableGit/usr/local/bin/ ~/public_html/progjava/local/
#mv ${tempdir}/PortableGit/etc/profile.d/ ~/public_html/progjava/etc/
rm -rf ${tempdir}
#chmod 755 -R ~/public_html/progjava/local/
#chmod 755 -R ~/public_html/progjava/etc/
#find ~/public_html/progjava/local/ -type f -print | xargs chmod 644
#find ~/public_html/progjava/etc/ -type f -print | xargs chmod 644
