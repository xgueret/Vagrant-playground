Vagrant.configure(2) do |config|
 
  VM_BOX = "bento/ubuntu-20.04"

  CONTROLLER_IP = "10.0.10.10"
  CONTROLLER_CPUS = 1
  CONTROLLER_MEM = 1024
  CONTROLLER_HOSTNAME = "control-ans"

  PATH_COMMON_SCRIPT  = "./scripts/common.sh"
  PATH_CONTROL_SCRIPT = "./scripts/control.sh" 

  MANAGED_HOST = [
    { :hostname => "node1-ans", :ip => "10.0.10.11", :cpus => 1, :mem => 512  },
    { :hostname => "node2-ans", :ip => "10.0.10.12", :cpus => 1, :mem => 512  }
  ]
  
  config.vm.box = VM_BOX

  # configuration du `controller host`
  config.vm.define CONTROLLER_HOSTNAME, primary: true do |h|
    h.vm.network "private_network", ip: CONTROLLER_IP
    h.vm.hostname = CONTROLLER_HOSTNAME

    h.vm.provider "virtualbox" do |v|
      v.customize [ "modifyvm", :id, "--cpus",   CONTROLLER_CPUS]
      v.customize [ "modifyvm", :id, "--memory", CONTROLLER_MEM]
      v.customize [ "modifyvm", :id, "--name",   CONTROLLER_HOSTNAME]
    end #end v

    #post install
    h.vm.provision :shell, :path => PATH_COMMON_SCRIPT
    h.vm.provision :shell, :path => PATH_CONTROL_SCRIPT
    
  end # end h


  # configuration des `managed host`
  MANAGED_HOST.each do |h|

    config.vm.define h[:hostname] do |cfg|
      cfg.vm.network "private_network", ip: h[:ip] 
      cfg.vm.hostname = h[:hostname]

      cfg.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus",   h[:cpus] ]
        v.customize [ "modifyvm", :id, "--memory", h[:mem] ]
        v.customize [ "modifyvm", :id, "--name",   h[:hostname] ]
      end #end v

      #post install
      cfg.vm.provision :shell, :path => PATH_COMMON_SCRIPT

    end # end cfg

  end #end h

end # end config