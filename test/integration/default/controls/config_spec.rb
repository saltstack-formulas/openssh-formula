# Overide by Platform
root_group = 'root'
if platform[:family] == 'freebsd'
  root_group = 'wheel'
end

control 'openssh configuration' do
  title 'should match desired lines'

  describe file('/etc/ssh/sshd_config') do
    it { should be_file }
    its('mode') { should cmp '0644' }
    it { should be_owned_by 'root' }
    it { should be_grouped_into root_group }
    its('content') { should include 'ChallengeResponseAuthentication no' }
    its('content') { should include 'X11Forwarding yes' }
    its('content') { should include 'PrintMotd no' }
    its('content') { should include 'AcceptEnv LANG LC_*' }
    its('content') { should include 'Subsystem sftp /usr/lib/openssh/sftp-server' }
    its('content') { should include 'UsePAM yes' }
  end

  describe file('/etc/ssh/ssh_config') do
    it { should be_file }
    its('mode') { should cmp '0644' }
    it { should be_owned_by 'root' }
    it { should be_grouped_into root_group }
    its('content') { should include 'Host *' }
    its('content') { should include '    GSSAPIAuthentication yes' }
    its('content') { should include '    HashKnownHosts yes' }
    its('content') { should include '    SendEnv LANG LC_*' }
  end
end
