# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.network "forwarded_port", guest: 3000, host: 8181,
    auto_correct: true
  config.vm.hostname = "rubyapp"
  config.vm.box = "precise32"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box"
  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|

    chef.json = {
        :rax_ruby_app => {
          :db_type => "postgres",
          :ruby_version => "1.9.3-p392",
          :ruby_install_type => "chruby",
          :git_url => 'https://github.com/kandanapp/kandan.git',
          :git_revision => 'v1.2'
        }
    }

    chef.run_list = [
        "recipe[rax-ruby-app]"
    ]
  end
end
