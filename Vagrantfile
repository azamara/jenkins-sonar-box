# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.55.10"

  # 기본 환경 구축
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'provision/chef/cookbooks'
    chef.add_recipe 'java'
    chef.json           = {
        :java  => {
            :jdk_version    => 7,
            :install_flavor => 'oracle',
            'oracle' => {
                'accept_oracle_download_terms' => true
            }
        }
    }
  end
  config.vm.provision 'shell', path: 'provision/shell/script.sh'
end
