require 'serverspec'
set :backend, :exec

def service_name()
  return case os[:family]
    when 'redhat' then 'sshd'
    when 'debian', 'ubuntu' then 'ssh'
  end
end

describe 'openssl/config.sls' do

  describe service(service_name()) do
    it { should be_running }
  end

end
