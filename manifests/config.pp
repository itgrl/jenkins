# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins::config
class jenkins::config {

  if $jenkins::homedir {
    ini_setting { 'JENKINS_HOME':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_HOME',
      value   => $jenkins::homedir,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::user {
    ini_setting { 'JENKINS_USER':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_USER',
      value   => $jenkins::user,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::install_skip_chown {
    ini_setting { 'JENKINS_INSTALL_SKIP_CHOWN':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_INSTALL_SKIP_CHOWN',
      value   => $jenkins::install_skip_chown,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::http_port {
    ini_setting { 'JENKINS_PORT':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_PORT',
      value   => $jenkins::http_port,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::http_listen_address {
    ini_setting { 'JENKINS_LISTEN_ADDRESS':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_LISTEN_ADDRESS',
      value   => $jenkins::http_listen_address,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::enable_https {
    if $jenkins::https_port {
      ini_setting { 'JENKINS_HTTPS_PORT':
        ensure  => present,
        path    => $jenkins::config_file,
        setting => 'JENKINS_HTTPS_PORT',
        value   => $jenkins::https_port,
        notify  => Service['jenkins']
      }
    }

    if $jenkins::https_listen_address {
      ini_setting { 'JENKINS_HTTPS_LISTEN_ADDRESS':
        ensure  => present,
        path    => $jenkins::config_file,
        setting => 'JENKINS_HTTPS_LISTEN_ADDRESS',
        value   => $jenkins::https_listen_address,
        notify  => Service['jenkins']
      }
    }

    if $jenkins::https_keystore {
      ini_setting { 'JENKINS_HTTPS_KEYSTORE':
        ensure  => present,
        path    => $jenkins::config_file,
        setting => 'JENKINS_HTTPS_KEYSTORE',
        value   => $jenkins::https_keystore,
        notify  => Service['jenkins']
      }
    }

    if $jenkins::https_keystore_password {
      ini_setting { 'JENKINS_HTTPS_KEYSTORE_PASSWORD':
        ensure  => present,
        path    => $jenkins::config_file,
        setting => 'JENKINS_HTTPS_KEYSTORE_PASSWORD',
        value   => $jenkins::https_keystore_password,
        notify  => Service['jenkins']
      }
    }
  }

  if $jenkins::handler_max {
    ini_setting { 'JENKINS_HANDLER_MAX':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_HANDLER_MAX',
      value   => $jenkins::handler_max,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::handler_idle {
    ini_setting { 'JENKINS_HANDLER_IDLE':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_HANDLER_IDLE',
      value   => $jenkins::handler_idle,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::debug {
    ini_setting { 'JENKINS_DEBUG_LEVEL':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_DEBUG_LEVEL',
      value   => $jenkins::debug,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::enable_access_log == 'yes' {
    if $jenkins::enable_access_log {
      ini_setting { 'JENKINS_ENABLE_ACCESS_LOG':
        ensure  => present,
        path    => $jenkins::config_file,
        setting => 'JENKINS_ENABLE_ACCESS_LOG',
        value   => $jenkins::enable_access_log,
        notify  => Service['jenkins']
      }
    }
  }
  else {
    ini_setting { 'JENKINS_ENABLE_ACCESS_LOG':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_ENABLE_ACCESS_LOG',
      value   => 'no',
      notify  => Service['jenkins']
    }
  }

  if $jenkins::args {
    ini_setting { 'JENKINS_ARGS':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_ARGS',
      value   => $jenkins::args,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::java_cmd {
    ini_setting { 'JENKINS_JAVA_CMD':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_JAVA_CMD',
      value   => $jenkins::java_cmd,
      notify  => Service['jenkins']
    }
  }

  if $jenkins::java_args {
    ini_setting { 'JENKINS_JAVA_OPTIONS':
      ensure  => present,
      path    => $jenkins::config_file,
      setting => 'JENKINS_JAVA_OPTIONS',
      value   => $jenkins::java_args,
      notify  => Service['jenkins']
    }
  }

}
