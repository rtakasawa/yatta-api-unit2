server '54.95.230.107', user: 'app', roles: %w{app db web1}
server '13.113.187.149', user: 'app-ec2', roles: %w{app db web2}
set :ssh_options, {
  keys: (ENV['PRODUCTION_SSH_KEY'])
  # forward_agent: true
}

# set :ssh_options, keys: "/Users/suketa/.ssh/id_rsa"

# ba:c5:3a:e6:fa:04:3d:c4:38:f4:d9:90:cb:41:7e:48
