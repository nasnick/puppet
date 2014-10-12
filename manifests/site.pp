import 'classes/*.pp'
class toolbox {
     file { '/usr/local/sbin/puppetsimple.sh':
        owner => root, group => root, mode => 0755,
        content => "#!/bin/sh\npuppet agent --onetime --no-daemonize --verbose $1",
}
}
node 'webserver01-salt.us-west-2.compute.internal’{
     include toolbox
     include apache
}



ubuntu@puppetmaster-salt:~$ cat /etc/puppet/manifests/classes/apache.pp
class apache {
package { 'apache2-mpm-prefork':
ensure => installed
}

}
#can you see this?
