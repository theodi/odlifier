[![Build Status](http://img.shields.io/travis/theodi/odlifier.svg)](https://travis-ci.org/theodi/odlifier)
[![Dependency Status](http://img.shields.io/gemnasium/theodi/odlifier.svg)](https://gemnasium.com/theodi/odlifier)
[![Coverage Status](http://img.shields.io/coveralls/theodi/odlifier.svg)](https://coveralls.io/r/theodi/odlifier)
[![Code Climate](http://img.shields.io/codeclimate/github/theodi/odlifier.svg)](https://codeclimate.com/github/theodi/odlifier)
[![Gem Version](http://img.shields.io/gem/v/odlifier.svg)](https://rubygems.org/gems/odlifier)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://theodi.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/pikesley/badger)

# ODLifier

Gets information on a license from the Open Knowledge Foundation's [Open Licenses Service](http://licenses.opendefinition.org/).

# Licence

This code is open source under the MIT license. See the LICENSE.md file for full details.

# Usage

Add the gem to your Gemfile:

	gem 'odlifier'

Require if you need to:

	require 'odlifier'

Request a licence

	license = Odlifier::License.define("odc-by-1.0")

Use the results

	license.domain_content
	license.domain_data
	license.domain_software
	license.family
	license.id
	license.is_okd_compliant
	license.is_osi_compliant
	license.is_osi_compliant
	license.status
	license.title
	license.url

# Contributing

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
