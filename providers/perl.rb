action :install do
  converge_by("Install perl version #{new_resource.name} using plenv") do
    bash "Install #{new_resource.name}" do
      user        new_resource.user
      environment "HOME" => "#{node.plenv.user_home_root}/#{new_resource.user}"
      path        ["#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin"]

      # `path` option seems to not work correctly...
      code <<-COMMAND
#{node.plenv.user_home_root}/#{new_resource.user}/.plenv/bin/plenv install #{new_resource.name} #{new_resource.install_options}
COMMAND
    end
  end
end

def whyrun_supported?
  true
end
