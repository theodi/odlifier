# ODLifier

[![Build Status](http://jenkins.theodi.org/job/ODLifier-master/badge/icon)](http://jenkins.theodi.org/job/ODLifier-master/)
[![Code Climate](https://codeclimate.com/github/theodi/ODLifier.png)](https://codeclimate.com/github/theodi/ODLifier)

Gets information on a license from the Open Knowledge Foundation's [Open Licenses Service](http://licenses.opendefinition.org/).

# Licence

This code is open source under the MIT license. See the LICENSE.md file for full details.

# Usage

Add the gem to your Gemfile:

	gem 'odlifier', :github => 'theodi/ODLifier'
		
Require if you need to:

	require 'odlifier'
		
Request a licence

	license = Odlifier::License.new("odc-by")
	
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
	

		
