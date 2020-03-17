tempdir="/home/teachers/t2015025/byod"
# date of every dir is set to $dirdate (for git clone)
dirdate=20200101
classname=java

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

mkdir -p ~/public_html/prog${classname}/local/
rsync --checksum -av --delete \
      --chmod=D755,F644   \
      ${tempdir}/PortableGit/usr/local/bin ~/public_html/prog${classname}/local/

rsync --checksum -av --delete \
      --chmod=D755,F644   \
      ${tempdir}/PortableGit/etc/profile.d ~/public_html/prog${classname}/etc/

rm -rf ${tempdir}
