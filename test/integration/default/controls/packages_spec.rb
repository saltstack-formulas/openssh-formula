# Overide by Platform
package_name = 'openssh-server'
if platform[:family] == 'suse'
  package_name = 'openssh'
end

control 'openssh package' do
  title 'should be installed'

  describe package(package_name) do
    it { should be_installed }
  end
end
