#!/bin/bash
gre='\033[1;32m'
echo "$gre scripted by sachin "
sleep 2
echo "$gre installing pakges>>>....."
apt-get update -y
apt-get upgrade -y
pkg install -y autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev
pkg install -y libpcap-dev libgmp-dev postgresql-dev readline-dev libsqlite-dev openssl-dev
pkg install -y libtool libxml2-dev libxslt-dev ncurses-dev pkg-config postgresql-contrib
pkg install -y wget make ruby-dev libgrpc-dev termux-tools ncurses ncurses-utils libsodium-dev
pkg install -y termux-exec
cd $HOME
curl -LO https://github.com/rapid7/metasploit-framework/archive/4.16.16.tar.gz
tar -xf $HOME/4.16.16.tar.gz
mv $HOME/metasploit-framework-4.16.16 $HOME/metasploit-framework
cd metasploit-framework
sed '/rbnacl/d' -i Gemfile.lock
sed '/rbnacl/d' -i metasploit-framework.gemspec

gem install bundler

#gem unpack rbnacl-libsodium -v'1.0.13'
#cd rbnacl-libsodium-1.0.13
#termux-fix-shebang ./vendor/libsodium/configure ./vendor/libsodium/build-aux/*
#sed 's|">= 3.0.1"|"~> 3.0", ">= 3.0.1"|g' -i rbnacl-libsodium.gemspec
#sed 's|">= 10"|"~> 10"|g' -i rbnacl-libsodium.gemspec
#curl -LO https://Auxilus.github.io/configure.patch
#patch ./vendor/libsodium/configure < configure.patch

#gem build rbnacl-libsodium.gemspec
#gem install rbnacl-libsodium-1.0.13.gem
#cd ..
#rm -rf rbnacl-libsodium-1.0.13
sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock 
gem install nokogiri -v 1.8.0 -- --use-system-libraries
#echo "$gre ------------------"
#echo "$gre       grpc"
#echo "$gre ------------------"
#sleep 2
#sed 's|grpc (.*|grpc (1.4.1)|g' -i $HOME/metasploit-framework/Gemfile.lock
#gem unpack grpc -v 1.4.1
#cd grpc-1.4.1
#curl -LO https://raw.githubusercontent.com/grpc/grpc/v1.4.1/grpc.gemspec
#curl -L https://raw.githubusercontent.com/Auxilus/Auxilus.github.io/master/Grpc_extconf.patch -o 
#extconf.patch
#patch -p1 < extconf.patch
#gem build grpc.gemspec
#gem install grpc-1.4.1.gem
#cd ..
#rm -r grpc-1.4.1
cd $HOME/metasploit-framework
rm $HOME/metasploit-framework/Gemfile.lock
bundle install -j5
$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
rm $HOME/metasploit-framework/modules/auxiliary/gather/http_pdf_authors.rb
cd $HOME
rm -rf 4.16.16.tar.gz
rm /data/data/com.termux/files/usr/bin/msfconsole
rm /data/data/com.termux/files/usr/bin/msfvenom
ln -s $HOME/metasploit-framework/msfconsole /data/data/com.termux/files/usr/bin/
ln -s $HOME/metasploit-framework/msfvenom /data/data/com.termux/files/usr/bin/

echo "$gre <<<Connect to Database>>>"
cd $HOME/metasploit-framework/config
touch database.yml
echo "production:" >> database.yml
echo "      adapter: postgresql" >> database.yml
echo "      database: msf_database" >> database.yml
echo "      username: msf" >> database.yml
echo "      password: msf" >> database.yml
echo "      host: 127.0.0.1" >> database.yml
echo "      port: 5432" >> database.yml
echo "      pool: 75" >> database.yml
echo "      timeout: 5" >> database.yml
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql
pg_ctl -D $PREFIX/var/lib/postgresql start
createuser msf
createdb msf_database
clear
sleep 2
echo "$gre sucessesfully installed "
sleep 1
echo "$gre --------------------------"
echo "$gre just execute msfconsole "
echo "$gre --------------------------"
echo
echo "Press enter to exit..."
read x
