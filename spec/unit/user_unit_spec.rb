require 'User'

describe User do
  describe '#name shows users name' do
    it 'expects to see the users name' do
      users = User.all
      expect(users).to include("my username")
      expect(users).to include("my name")
      expect(users).to include("my password")
      expect(users).to include("email@email.com")
    end
  end

end
