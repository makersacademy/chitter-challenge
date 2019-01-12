require './lib/user.rb'

RSpec.describe User do 

  describe '#create' do
    let!(:user) { User.create({firstname: "Doug", surname: "Holmes", email: "doug@doug", password: "carolisawesome"}) } 
    it 'stores users name' do
      expect(user.firstname).to eq "Doug"
      expect(user.surname).to eq "Holmes"
    end
    it 'stores an email' do 
      expect(user.email).to eq "doug@doug"
    end
  end

  describe '#authenticate' do 
    
end 