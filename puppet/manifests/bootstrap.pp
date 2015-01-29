include bootstrap

import "./core/*", "./bootstrap/*"

# Class: bootstrap
#
#
class bootstrap
{
Exec {
    path        => "/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin",
    path        => "/bin/:/sbin/:/usr/bin/:/usr/sbin/:/usr/local/bin:/opt/vagrant_ruby/bin/",
     environment => "HOME=/home/vagrant"
   }
  include core::params

  include bootstrap::update,
          bootstrap::packages,
          bootstrap::modules
}
