# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'puppetlabs/centos-6.6-64-nocm'

  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = 2
    vb.memory = 1024
  end

  # To speedup installation of packages on slow networks
  # run `vagrant plugin install vagrant-cachier` once
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box

    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end
end
