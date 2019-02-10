# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins
#
#   Default values found in data/common.yaml
class jenkins (
  String  $homedir,
  String  $version,
  String  $user,
  Integer $debug,
  Integer $handler_max,
  Integer $handler_idle,
  String  $java_args,
  Boolean $configure_firewall, # Defaults true
  Integer $http_port, # Defaults 8080
  Integer $https_port, # Defaults 8081
  String  $config_file,
  String $http_listen_address, 
  String $https_listen_address,
  Enum['yes','no'] $enable_access_log,
  Boolean $enable_https = false,
  $https_keystore = undef,
  $https_keystore_password = undef,
  $args = undef,
  $java_cmd = undef,
  $install_skip_chown = false,
){

    include jenkins::install
    include jenkins::firewall
    include jenkins::config
    include jenkins::service
    Class['jenkins::install']
      -> Class['jenkins::config']
        -> Class['jenkins::firewall']
          -> Class['jenkins::service']

}
