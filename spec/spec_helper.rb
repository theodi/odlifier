require 'coveralls'
Coveralls.wear!

require 'vcr'
require 'odlifier'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.default_cassette_options = { :record => :once }
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.order = "random"
end
