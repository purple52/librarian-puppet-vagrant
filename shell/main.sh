#!/bin/sh

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, you can manually install it at this point.
# eg, for Debian/Ubuntu, uncomment the following line:

# apt-get -q -y install git

if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet
  su -c "cd /vagrant/puppet && librarian-puppet install --clean" -l vagrant
else
  su -c "cd /vagrant/puppet && librarian-puppet update" -l vagrant
fi

