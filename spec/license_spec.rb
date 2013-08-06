require 'spec_helper'

describe ODLifier do
  
    before :all do
      VCR.use_cassette('license') do
        @license = ODLifier::License.new("odc-by")
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
      @license.id.should == "odc-by"
    end
    
    it 'returns the correct OKD compliance level' do
      @license.is_okd_compliant.should == true
    end
    
    it 'returns the correct OSI compliance level' do
      @license.is_osi_compliant.should == false
    end
  
    it 'returns the correct maintainer' do
      @license.maintainer.should == ""
    end
    
    it 'returns the correct status' do
      @license.status.should == "active"
    end
    
    it 'returns the correct title' do
      @license.title.should == "Open Data Commons Attribution License"
    end
    
    it 'returns the correct url' do
      @license.url.should == "http://www.opendefinition.org/licenses/odc-by"
    end
    
end