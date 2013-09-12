require 'httparty'

module Odlifier
  class License
    include HTTParty
  
    def initialize(id)
      response = self.class.get("http://licenses.opendefinition.org/licenses/#{id}.json")
      unless response.header.code == "404"
        response.parsed_response.each do |key, val|
          self.class.send(:define_method, key.to_sym) { val }
        end
      else
        raise ArgumentError, "License with the id '#{id}' cannot be found"
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
