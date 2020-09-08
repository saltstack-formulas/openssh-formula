# frozen_string_literal: true

mapdata_file = "_mapdata/#{system.platform[:finger].split('.').first}.yaml"
mapdata_dump = inspec.profile.file(mapdata_file)

control '`map.jinja` YAML dump' do
  title 'should contain the lines'

  describe file('/tmp/salt_mapdata_dump.yaml') do
    it { should exist }
    its('content') { should eq mapdata_dump }
  end
end
