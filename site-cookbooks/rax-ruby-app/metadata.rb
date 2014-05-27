# Encoding: utf-8
name             'rax-ruby-app'
maintainer       'Rackspace'
maintainer_email 'jason.boyles@rackspace.com'
license          'Apache 2.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'


depends "apt"
depends "build-essential"
depends "postgresql"
depends "chruby"
depends "mysql"
depends "application"
depends "database"
