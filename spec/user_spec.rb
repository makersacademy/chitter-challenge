require 'user'
require 'pg'

describe User do 
  describe "#email" do 
    it 'should have an email' do 
      test_user = User.new('test name', 'email@email.com')
      expect(test_user.email).to eq "email@email.com"
    end 
  end 
  
  describe "#name" do 
    it 'should have a name' do 
      test_user = User.new('test name', 'email@email.com')
      expect(test_user.name).to eq "test name"
    end 
  end 
end 