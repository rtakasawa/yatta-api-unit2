server '54.95.230.107', user: 'app', roles: %w{app db web1}
server '103.4.12.53', user: 'app-ec2', roles: %w{app db web2}
set :ssh_options, keys: "/Users/suketa/.ssh/id_rsa"