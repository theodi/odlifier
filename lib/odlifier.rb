require 'httparty'

module ODLifier
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
end
