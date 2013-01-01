#!/bin/sh

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum
if ! [ -x /usr/bin/git ]; then
    if [ -x /usr/sbin/yum ]; then
        yum -q -y install git
    elif [ -x /usr/sbin/apt-get ]; then
        apt-get -q -y install git
    else
        echo "No package installer available. You may need to install git manually."
    fi
fi

cp /vagrant/puppet/Puppetfile $PUPPET_DIR

if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi

