require 'user'

describe User do

  describe '.attr_readers' do

    it 'creates a user' do
      User.create('Jay', 'Namast_Jay', 'Jay@hotmail.com', 'Password')
    end

    it 'searches for user via email and password and returns name and username' do
      User.create('Jay', 'Namast_Jay', 'Jay@hotmail.com', 'Password')
      expect(User.login('Jay@hotmail.com', 'Password')).to eq(["Jay", "Namast_Jay"])
    end

  end

end
