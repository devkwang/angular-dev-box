package { "python-software-properties":
  ensure  => "installed"
}

package { "ruby":
  ensure  => "installed",
  # easier to read require
  require => Exec [ "apt-get update" ]
}

package { "ruby-compass":
  ensure  => "installed",
  # easier to read require
  require => Exec [ "apt-get update" ]
}

package { "curl":
  ensure  => "installed",
  # easier to read require
  require => Exec [ "apt-get update" ]
}

exec { "apt-get update":
  command => "/usr/bin/apt-get update"
}

package { "git":
  ensure  => "installed",
  require => Exec [ "apt-get update" ]
}

exec { '/usr/bin/git config --global url."https://".insteadOf git://':
  user        => "vagrant",
  environment => "HOME=/home/vagrant",
  require     => Package [ "git" ]
}

file { '/home/vagrant/.gitconfig':
  ensure => "present"
}

package { "npm":
  ensure  => "installed",
  require => Exec [ "apt-get update" ]
}

package { "nodejs":
  ensure  => "installed",
  require => Exec [ "apt-get update" ]
}

file { '/usr/bin/node':
   ensure => 'link',
   target => '/usr/bin/nodejs'
}

exec { "/usr/bin/npm install -g yo":
  user      => "root",
  logoutput => "on_failure",
  creates   => "/usr/local/bin/yo",
  require   => Package [ "npm" ]
}

exec { "/usr/bin/npm install -g generator-angular":
  user      => "root",
  logoutput => "on_failure",
  creates   => "/usr/local/lib/node_modules/generator-angular",
  require   => Exec [ "/usr/bin/npm install -g yo" ]
}

exec { "/usr/bin/npm cache clean ":
  user      => "root",
  logoutput => "on_failure",
  require   => Exec [ "/usr/bin/npm install -g generator-angular" ]
}
