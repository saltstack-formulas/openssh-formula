# frozen_string_literal: true

# Overide by Platform
service_name = 'sshd'
service_name = 'ssh' if platform[:family] == 'debian'

control 'openssh service' do
  impact 0.5
  title 'should be running and enabled'

  describe service(service_name) do
    it { should be_enabled }
    it { should be_running }
  end
end
