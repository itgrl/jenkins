# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins::firewall
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins::firewall
class jenkins::firewall {

  if $jenkins::configure_firewall {
    if fact('osfamily') == 'RedHat' and fact('operatingsystemmajrelease') == '7' {
      include firewalld
      if $jenkins::enable_https {
        firewalld::custom_service{'jenkins':
          short       => 'JenkinsServicePorts',
          description => 'Jenkins service firewalld port exceptions',
          port        => [
            {
              'port'     => $jenkins::http_port,
              'protocol' => 'tcp',
            },
            {
              'port'     => $jenkins::https_port,
              'protocol' => 'udp',
            },
          ],
          module      => ['nf_conntrack_netbios_ns'],
          destination => {
            'ipv4' => '127.0.0.1',
            'ipv6' => '::1'
          }
        }
        firewalld_port { "Open port $jenkins::http_port in the public zone":
          ensure   => present,
          zone     => 'public',
          port     => $jenkins::http_port,
          protocol => 'tcp',
        }
        firewalld_port { "Open port $jenkins::https_port in the public zone":
          ensure   => present,
          zone     => 'public',
          port     => $jenkins::https_port,
          protocol => 'tcp',
        }        
      } else {
        firewalld::custom_service{'jenkins':
          short       => 'JenkinsServicePorts',
          description => 'Jenkins service firewalld port exceptions',
          port        => [
            {
              'port'     => $jenkins::http_port,
              'protocol' => 'tcp',
            },
          ],
          module      => ['nf_conntrack_netbios_ns'],
          destination => {
            'ipv4' => '127.0.0.1',
            'ipv6' => '::1'
          }
        }
        firewalld_port { "Open port $jenkins::http_port in the public zone":
          ensure   => present,
          zone     => 'public',
          port     => $jenkins::http_port,
          protocol => 'tcp',
        }        
      }
    }
    elsif fact('osfamily') == 'RedHat' and fact('operatingsystemmajrelease') == '6' {
      include firewall
      firewall { '100 allow http access to jenkins':
        dport  => [$jenkins::http_port],
        proto  => tcp,
        action => accept,
      }
      if $enable_https {
        firewall { '100 allow http access to jenkins':
          dport  => [$jenkins::https_port],
          proto  => tcp,
          action => accept,
        }
      }
    }
  }
}

