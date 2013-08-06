lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

# Maintain your gem's version:
require "odlifier/version"

Gem::Specification.new do |s|
  s.name        = 'odlifier'
  s.version     =  Odlifier::VERSION
  s.date        = '2013-08-06'
  s.summary     = "Get information about an open licence using a simple identifier"
  s.authors     = ["Stuart Harrison"]
  s.email       = 'tech@theodi.org'
  s.homepage    = "http://github.com/odlifier"
  s.files       = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.md", "README.md"]
  s.license     = 'MIT'
  
  s.add_dependency "httparty"
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "vcr"
  s.add_development_dependency "simplecov-rcov"
end