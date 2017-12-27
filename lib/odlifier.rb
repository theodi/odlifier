require 'httparty'

module Odlifier
  class License
    include HTTParty

    ODL_PREFIX = 'http://licenses.opendefinition.org'

    def initialize(hash)
      hash.each do |key, val|
        self.class.send(:define_method, key.to_sym) { val }
      end
    end

    def self.define(id)
      response = self.get("#{ODL_PREFIX}/licenses/#{id}.json")
      unless response.header.code == "404"
        License.new(response.parsed_response)
      else
        # Try and get an ID with a version number
        candidates = gather_candidiates(id)
        if candidates.count == 0
          raise ArgumentError, "License with the id '#{id}' cannot be found"
        else
          License.new(candidates.last) # Assume the latest version
        end
      end
    end

    def self.gather_candidiates(id)
      candidates = []
      response = self.get("#{ODL_PREFIX}/licenses/groups/all.json")
      response.parsed_response.each do |key, val|
        candidates << val if license_id_matches(id, val)
      end
      candidates
    end

    def self.license_id_matches(id, val)
      if id.match /[0-9]+\.[0-9]+$/
        val['id'].match /#{id}/i or (val['legacy_id'] and val['legacy_id'].match /#{id}/i)
      else
        val['id'].match /#{id}-[0-9]+\.[0-9]+/i or (val['legacy_id'] and val['legacy_id'].match /#{id}-[0-9]+\.[0-9]+/i)
      end
    end

  end

  # List a load of content license IDs
  def self.content_licenses
    [
      'cc-by',
      'cc-by-sa',
      'cc-zero',
      'cc-nc',
      'fal',
      'odc-pddl',
      'odc-by',
      'odc-odbl',
      'other-pd',
      'uk-ogl',
    ]
  end

  # Translate license IDs into English titles
  def self.translate(license_id, default = nil)
    {
      'cc-by'    => 'Creative Commons Attribution',
      'cc-by-sa' => 'Creative Commons Attribution Share-Alike',
      'cc-zero'  => 'Creative Commons CCZero',
      'cc-nc'    => 'Creative Commons Non-Commercial',
      'fal'      => 'Free Art License',
      'odc-pddl' => 'Open Data Commons Public Domain Dedication and Licence',
      'odc-by'   => 'Open Data Commons Attribution License',
      'odc-odbl' => 'Open Data Commons Open Database License',
      'other-pd' => 'Public domain',
      'uk-ogl'   => 'UK Open Government Licence',
    }[license_id] || default
  end

end
