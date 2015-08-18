require 'spec_helper'


describe Peep do 
  
  it 'has a valid factory' do 
    expect(FactoryGirl.create(:peep)).to be_valid
  end
  
end