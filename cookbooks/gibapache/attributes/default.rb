default['gibapache']['ServerRoot'] = "/etc/httpd"
default['gibapache']['servername'] = "localhost"
default['gibapache']['log_dir'] = "/home/www-log"
default['gibapache']['error_log'] = "error_log"
default['gibapache']['access_log'] = "access.pipe"
default['gibapache']['user']    = "www"
default['gibapache']['group']   = "apache"
default['gibapache']['binary']  = "/usr/sbin/httpd"
default['gibapache']['docroot_dir'] = "/home/www"
default['gibapache']['docroot_dir_html'] = "/home/www/html"
default['gibapache']['pid_file'] = "/var/run/httpd.pid"

# General settings
#default['gibapache']['listen_ports'] = ["80"]
default['gibapache']['timeout'] = 30
default['gibapache']['keepalive'] = "On"
default['gibapache']['keepaliverequests'] = 100
default['gibapache']['keepalivetimeout'] = 10

# Security
default['gibapache']['servertokens'] = "Prod"
default['gibapache']['serversignature'] = "Off"

 
# Prefork Attributes
default['gibapache']['prefork']['startservers'] = 15
default['gibapache']['prefork']['minspareservers'] = 5
default['gibapache']['prefork']['maxspareservers'] = 20
default['gibapache']['prefork']['serverlimit'] = 300
default['gibapache']['prefork']['maxclients'] = 300
default['gibapache']['prefork']['maxrequestsperchild'] = 10000

# Worker Attributes
default['gibapache']['worker']['startservers'] = 5
default['gibapache']['worker']['maxclients'] = 300
default['gibapache']['worker']['minsparethreads'] = 25
default['gibapache']['worker']['maxsparethreads'] = 74
default['gibapache']['worker']['threadsperchild'] = 25
default['gibapache']['worker']['maxrequestsperchild'] = 0

