# Sample CM class for SSH

package { 'openssh-server':
  ensure => installed,
}

service { 'openssh-server':
  ensure  => running,
  name    => 'sshd',
  require => Package['openssh-server'],
}

file {'/etc/ssh/sshd_config':
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  source  => 'puppet:///modules/demo/sshd_config',
  require => Package['openssh-server'],
  notify  => Service['openssh-server'],
}
