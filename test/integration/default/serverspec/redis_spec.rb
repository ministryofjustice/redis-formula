require 'serverspec'

set :backend, :exec

set :path, '/sbin:/usr/local/sbin:$PATH'

describe package("redis-server") do
  it { should be_installed }
end

describe service("redis-server") do
  it { should be_enabled }
  it { should be_running }
end

describe port(6379) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/redis/redis.conf') do
  it { should be_file }
  it { should be_mode 644 }
end

describe file('/data/redis') do
  it { should be_directory }
  it { should be_owned_by 'redis' }
end

describe iptables do
  it { should have_rule('-A INPUT -p tcp -m tcp --dport 6379 -m comment --comment redis-tcp-6379 -j ACCEPT') }
end
