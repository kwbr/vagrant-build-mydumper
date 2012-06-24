Vagrant::Config.run do |config|
    config.vm.box = "aegir-up-debian-stable-64-bit"

    config.vm.share_folder "v-debs", "/opt/debs", "debs"

    config.vm.boot_mode = :gui

    config.vm.customize do |vm|
        vm.memory_size = 512
        vm.name = "Build Mydumper"
        vm.cpu_count = 2
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.module_path = "modules"
        puppet.manifest_file  = "mydumper.pp"
    end
end
