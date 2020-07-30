# frozen_string_literal: true

# Replace per minion strings
replacement = {
  hostname: system.hostname
}

mapdata_file = "mapdata/#{system.platform[:finger].split('.').first}.yaml"
mapdata_dump = inspec.profile.file(mapdata_file) % replacement

control '`map.jinja` YAML dump' do
  title 'should contain the lines'

  describe file('/tmp/salt_mapdata_dump.yaml') do
    it { should exist }
    its('content') { should include mapdata_dump }
  end
end
