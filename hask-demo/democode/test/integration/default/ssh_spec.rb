# Basic inspec tests

describe package('openssh-server') do
  it { should be_installed }
end

describe service('sshd') do
  it { should be_running }
end

describe file('/etc/ssh/sshd_config') do
  it { should exist }
end
