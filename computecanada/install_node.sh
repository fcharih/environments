cd $HOME
#git clone https://github.com/nodejs/node.git
cd node
./configure --prefix=$HOME/software/node
make -j4
make install
cd $HOME
rm -rf node
