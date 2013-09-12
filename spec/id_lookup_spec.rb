require 'spec_helper'

describe Odlifier do
  
  it 'provides a list of content licenses' do
    Odlifier.content_licenses.should include('cc-by')
    Odlifier.content_licenses.should include('uk-ogl')
  end

  it 'translates content ids locally' do
    Odlifier.translate('cc-by').should == 'Creative Commons Attribution'
  end
    
end
