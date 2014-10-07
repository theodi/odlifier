require 'spec_helper'

describe Odlifier::License do

    before :all do
      VCR.use_cassette('license') do
        @license = Odlifier::License.define("odc-by-1.0")
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

    it 'returns nil when the ID cannot be found' do
      VCR.use_cassette('license-made-up') do
        id = "this-is-obviously-made-up"
        expect { Odlifier::License.define(id) }.to raise_error(ArgumentError)
      end
    end

end
