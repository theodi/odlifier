require 'spec_helper'

describe Odlifier::License do

  context 'when version number is specified' do
    before :all do
      VCR.use_cassette('license') do
        @license = Odlifier::License.define("ODC-BY-1.0")
      end
    end

    it 'returns the correct domain content value' do
      @license.domain_content.should == false
    end

    it 'returns the correct domain data value' do
      @license.domain_data.should == true
    end

    it 'returns the correct domain software value' do
      @license.domain_software.should == false
    end

    it 'returns the correct family value' do
      @license.family.should == ""
    end

    it 'returns the correct id' do
      @license.id.should == "ODC-BY-1.0"
    end

    it 'returns the correct open definition compliance level' do
      @license.od_conformance.should == "approved"
    end

    it 'returns the correct open source definition compliance level' do
      @license.osd_conformance.should == "not reviewed"
    end

    it 'returns the correct maintainer' do
      @license.maintainer.should == "Open Data Commons"
    end

    it 'returns the correct status' do
      @license.status.should == "active"
    end

    it 'returns the correct title' do
      @license.title.should == "Open Data Commons Attribution License 1.0"
    end

    it 'returns the correct url' do
      @license.url.should == "http://www.opendefinition.org/licenses/odc-by"
    end
  end

  it 'returns nil when the ID cannot be found' do
    VCR.use_cassette('license-made-up') do
      id = "this-is-obviously-made-up"
      expect { Odlifier::License.define(id) }.to raise_error(ArgumentError)
    end
  end

  it 'tries to get a license when the version number is not specified' do
    VCR.use_cassette('license-no-version-number') do
      license = Odlifier::License.define("OGL-UK")
      license.id.should == "OGL-UK-2.0"
    end
  end

  it 'tries to get versioned license when key is lowercase' do
    VCR.use_cassette('license') do
      license = Odlifier::License.define("odc-by-1.0")
      license.id.should == "ODC-BY-1.0"
    end
  end

  it 'get current ID when key is a legacy ID' do
    VCR.use_cassette('legacy-id') do
      license = Odlifier::License.define('eclipse-1.0')
      license.id.should == 'EPL-1.0'
    end
  end
end
