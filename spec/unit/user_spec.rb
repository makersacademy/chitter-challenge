require 'user'
require_relative '../helpers/database_helpers'

describe 'User' do
  describe '.create' do
    it 'creates new user at signup' do
      user = User.create(username: 'JPRudrum', password: 'AFC4LYF', email: 'jr@gmail.com'  )
      persisted_data = persisted_data_2(id: user.id)

      expect(user).to be_a User
      expect(user.username).to eq 'JPRudrum'
      expect(user.password).to eq 'AFC4LYF'
      expect(user.email).to eq 'jr@gmail.com'
    end
  end
end
