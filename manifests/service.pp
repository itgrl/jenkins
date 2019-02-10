# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include jenkins::service
class jenkins::service {

  service { 'jenkins':
    ensure     => running,
    enable     => true,
  }

}
