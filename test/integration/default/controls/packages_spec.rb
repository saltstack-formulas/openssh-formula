# frozen_string_literal: true

# Overide by Platform
package_name =
  case platform[:family]
  # `linux` here is sufficient for `arch`
  when 'suse', 'linux'
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
