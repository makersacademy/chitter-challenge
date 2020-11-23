require 'user'

describe User do

  describe '.create' do
    it 'creates a new user in the database' do
      user = User.create(name: 'Hyko', username: 'hykothehusky', email: 'hyko@hyko.com', password: 'squirrels')
      persisted_user = persisted_user(id: user.id)
      expect(user).to be_a User
      expect(user.username).to eq 'hykothehusky'
    end
  end

end
