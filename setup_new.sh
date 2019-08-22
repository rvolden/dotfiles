#!/bin/bash

### RUN AS ROOT ###

cd ~/

# install terminator, vim, and htop
yes | apt-get install terminator vim htop

# install chrome
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >>/etc/apt/sources.list
wget https://dl.google.com/linux/linux_signing_key.pub
apt-key add linux_signing_key.pub
apt update
yes | apt install google-chrome-stable
rm -rf /etc/apt/sources.list.d/google-chrome.list
rm -rf linux_signing_key*

# install minknow
wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add -
echo "deb http://mirror.oxfordnanoportal.com/apt xenial-stable non-free" | tee /etc/apt/sources.list.d/nanoporetech.sources.list
apt-get update
yes | apt-get install minknow-nc
echo "alias minknow='/opt/ui/MinKNOW'" >>~/.bashrc

# install guppy
# be sure graphics card is installed at this point
apt-get update
apt-get install wget lsb-release
export PLATFORM=$(lsb_release -cs)
wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | sudo apt-key add -
echo "deb http://mirror.oxfordnanoportal.com/apt ${PLATFORM}-stable non-free" | sudo tee /etc/apt/sources.list.d/nanoporetech.sources.list
apt-get update
yes | apt-get install ont-guppy

# install atom
add-apt-repository ppa:webupd8team/atom
apt update; yes | apt install atom

# make ssh-able & rmate
# yes | apt-get install openssh-server openssh-client
yes | apt-get install curl ruby
gem install rmate
gem update rmate
echo "alias ratom=rmate" >>~/.bashrc

# install pip things
yes | apt install python3-pip python-pip
pip3 install matplotlib scipy numpy editdistance sklearn
pip install matplotlib scipy numpy editdistance sklearn

# install R
yes | apt-get install r-base

# install Go
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
cp /usr/local/go/bin/* /bin/

# install blat
rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/blat ./
cp ~/blat/blat /bin/

# get C3POa
git clone https://github.com/rvolden/C3POa.git

# install gonk
git clone https://github.com/rvolden/gonk.git
cd gonk; make; cd ~/; cp ~/gonk/gonk /bin/

# install emtrey (sam2psl)
git clone https://github.com/rvolden/emtrey.git
cd emtrey; make; cd ~/; cp ~/emtrey/emtrey /bin

# install racon
git clone --recursive https://github.com/isovic/racon.git racon
cd racon
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cp ~/racon/build/bin/racon /bin/
cd ~/

# install poa
git clone https://github.com/tanghaibao/bio-pipeline.git
cd bio-pipeline/poaV2/
make poa
cp ~/bio-pipeline/poaV2/poa /bin/
cd ~/

# install minimap2
git clone https://github.com/lh3/minimap2
cd minimap2 && make
cp ~/minimap2/minimap2 /bin/
cd ~/

# install samtools
git clone https://github.com/samtools/samtools.git
git clone https://github.com/samtools/htslib.git
git clone https://github.com/samtools/bcftools.git
cd htslib && autoheader && autoconf && ./configure && make && make install
cd ~/samtools; autoheader; autoconf -Wno-syntax; ./configure; make; make install
cd ~/

# install featureCounts
# go here http://subread.sourceforge.net/ and download latest version
# tar xzf subread*; cd subread*/src/; make -f Makefile.Linux; cp ../bin/featureCounts /bin/

# install java
apt-get-repository ppa:linuxuprising/java
apt-get update
apt-get install oracle-java11-installer
apt-get install oracle-java11-set-default

# install sam2psl
# git clone "https://github.com/lindenb/jvarkit.git"
# cd jvarkit
# ./gradlew sam2psl
# echo "alias sam2psl='java -jar /home/vulpter/jvarkit/dist/sam2psl.jar'" >>~/.bashrc
# cd ~/

# get Mandalorion
git clone https://github.com/rvolden/Mandalorion-Episode-II.git

# install STAR
git clone https://github.com/alexdobin/STAR.git
cd STAR/source
make STAR
cd ~/; cp ~/STAR/bin/Linux_x86_64/STAR /bin/

# install gmap
wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2019-05-12.tar.gz
tar -xzf gmap*z; cd gmap*; ./configure; make; make install; cd ~/

mkdir misc_zipped; mv *tar.gz misc_zipped

# set misc aliases and color prompt
echo "alias open='xdg-open'" >>~/.bashrc
echo "alias gtop='watch nvidia-smi'" >>~/.bashrc
echo 'PS1="\[\e[38;5;43m\]\h\[\e[38;5;157m\]@\[\e[38;5;215m\]\u\[\e[0m\] \[\e[38;5;39m\]\W \[\e[0m\]$ "' >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS:'*.pdf=38;5;227' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS:'*.fastq=38;5;156' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS:'*.fasta=38;5;121' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS:'*.py=38;5;43:' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS'*.cu=38;5;76:' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS'*.go=38;5;38:' ; export LS_COLORS" >>~/.bashrc
echo "LS_COLORS=\$LS_COLORS'*.c=38;5;74:' ; export LS_COLORS" >>~/.bashrc
source ~/.bashrc
