require 'httparty'

class ODLifier
  include HTTParty
  
  def initialize(id)
    response = self.class.get("http://licenses.opendefinition.org/licenses/#{id}.json")
    response.parsed_response.each do |key, val|
      self.class.send(:define_method, key.to_sym) { val }
    end
  end
  
end
