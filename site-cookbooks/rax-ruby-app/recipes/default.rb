
include_recipe 'apt::default'
include_recipe 'build-essential::default'

user "rails" do
  supports :manage_home => true
  comment "Rails user"
  home "/home/rails"
  shell "/bin/bash"
  system true
end

group "admin" do
  action :modify
  members "rails"
  append true
end

if node[:rax_ruby_app][:db_type] == 'postgres'
  node.set[:postgresql][:password][:postgres] = 'password'
  include_recipe 'postgresql::server'
elsif node[:rax_ruby_app][:db_type] == 'mysql'
  #do mysql stuff
end

if node[:rax_ruby_app][:ruby_install_type] == 'chruby'
  node.set[:chruby][:rubies] = { "#{node[:rax_ruby_app][:ruby_version]}" => true}
  node.set[:chruby][:default] = node[:rax_ruby_app][:ruby_version]
  include_recipe 'chruby::system'
elsif node[:rax_ruby_app][:ruby_install_type] == 'rvm'
  #do rvm stuff
end

application "app" do
  path '/home/rails/rails_app'
  owner 'rails'
  group 'rails'
  repository node[:rax_ruby_app][:git_url]
  revision node[:rax_ruby_app][:git_revision]
end
