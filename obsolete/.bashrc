PS1="\! @\h \W $ "
alias ll='ls -lh'
PATH=/nfs/users/nfs_f/fy2/software/paml4.7/bin:~/bin:/nfs/users/nfs_f/fy2/software/GenScan:$PATH

PATH=/nfs/users/nfs_f/fy2/software/ncbi-blast-2.2.28+/bin/:$PATH

export http_proxy=http://wwwcache.sanger.ac.uk:3128
export https_proxy=http://wwwcache.sanger.ac.uk:3128
#source /software/pathogen/internal/pathdev/bin/setup_pathpipe_environment.sh
export PERL5LIB='';
export SHELL=/bin/bash
export PAMLDIR=/nfs/users/nfs_f/fy2/software/paml4.7/bin
export PHYLIPVERSION=3.6
export BLASTDIR=/software/ncbiblast/bin
export EPONINEDIR=/nfs/users/nfs_f/fy2//bin
export GENSCAN_DIR=/nfs/users/nfs_f/fy2/software/GenScan
if [ -f /software/perl-5.8.8/bin/perl ];
then 
    source ~/perl5/perlbrew/etc/bashrc
else
#    echo "Wont use Perlbrew."
fi
export LSB_DEFAULTPROJECT=team81
#eval $(perl -I/www/perllib/lib/perl5 -Mlocal::lib=/www/perllib)
