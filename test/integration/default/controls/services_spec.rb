# Overide by Platform
service_name = 'sshd'
if platform[:family] == 'debian'
  service_name = 'ssh'
end

control 'openssh service' do
  impact 0.5
  title 'should be running and enabled'

  describe service(service_name) do
    it { should be_enabled }
    it { should be_running }
  end
end
