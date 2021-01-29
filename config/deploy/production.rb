server '54.95.230.107', user: 'app', roles: %w{app db web1}
server '13.113.187.149', user: 'app-ec2', roles: %w{app db web2}
set :ssh_options, {
  keys: (ENV['PRODUCTION_SSH_KEY']),
  forward_agent: true
}

# server '54.95.230.107', user: 'app', roles: %w{app db web1}
# set :ssh_options, keys: "/Users/suketa/.ssh/id_rsa"
