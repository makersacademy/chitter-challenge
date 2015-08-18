require 'spec_helper'


describe User do 
  
  it 'has a valid factory' do 
    expect(FactoryGirl.create(:user)).to be_valid
  end
  
end

