# Overide by Platform
package_name =
  case platform[:family]
  when 'suse'
    'openssh'
  else
    'openssh-server'
  end

control 'openssh package' do
  title 'should be installed'

  only_if do
    platform.family != 'bsd'
  end

  describe package(package_name) do
    it { should be_installed }
  end
end
