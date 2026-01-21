# frozen_string_literal: true

# Overide by Platform
root_group =
  case platform[:family]
  when 'bsd'
    'wheel'
  else
    'root'
  end

github_known_host = 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGm[...]'
gitlab_known_host_re = /gitlab.com[0-9a-f.:,]* ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABA/
minion_rsa_known_host = /minion\.id,alias\.of\.minion.id[0-9a-f.:,]* ssh-rsa .+/
minion_ed25519_known_host = /minion\.id,alias\.of\.minion\.id[0-9a-f.:,]* ssh-ed25519 .+/

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
    unless %w[openbsd].include?(platform[:name])
      its('content') { should include 'UsePAM yes' }
    end
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

  describe file('/etc/ssh/ssh_known_hosts') do
    it { should be_file }
    its('mode') { should cmp '0644' }
    it { should be_owned_by 'root' }
    it { should be_grouped_into root_group }
    its('content') { should include github_known_host }
    its('content') { should match(gitlab_known_host_re) }
    its('content') { should match minion_rsa_known_host }
    its('content') { should match minion_ed25519_known_host }
  end
end
