require './lib/user.rb'

RSpec.describe User do 
  let!(:user) { User.create({ firstname: "Doug", surname: "Holmes", email: "doug@doug", password: "carolisawesome" }) } 
  let(:user_again) { User.create({ firstname: "Doug", surname: "Holmes", email: "doug@doug", password: "carolisawesome" }) } 
  describe '#create' do
   
    it 'stores users name' do
      expect(user.firstname).to eq "Doug"
      expect(user.surname).to eq "Holmes"
    end
    it 'stores an email' do 
      expect(user.email).to eq "doug@doug"
    end
  end

  describe '#valid?' do 
    # user = User.create(firstname: "Doug", surname: "Holmes", email: "doug2@doug", password: "carolisawesome")
    # user2 = User.create(firstname: "Carol", surname: "Gardiner", email: "doug3@doug3", password: "carolisawesome")
    it 'prevents a user signing up with the same email' do 
      expect(user.valid?).to eq true
      expect(user_again.valid?).to eq false
    end
  end 
end
