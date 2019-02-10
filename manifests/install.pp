# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins::install
class jenkins::install {

  class { 'java' :
    package => 'java-1.8.0-openjdk-devel',
  }

  yumrepo { 'jenkins':
    ensure   => 'present',
    baseurl  => 'http://pkg.jenkins.io/redhat',
    descr    => 'Jenkins',
    gpgkey   => 'https://pkg.jenkins.io/redhat/jenkins.io.key',
    gpgcheck => '1',
  }

  package { 'jenkins':
    ensure => installed,
  }

}
