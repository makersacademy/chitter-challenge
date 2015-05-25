require 'pry'

describe User do
  context 'Making sure Datamapper is adding and deleting user entries' do

    it 'should be created and retrieved from the db' do
      expect(User.count).to eq(0)
      User.create(username: 'user9319062',
                  name:     'Denble Xaia',
                  email:    'testes@test.com',
                  password: 'pass_merde')
      expect(User.count).to eq(1)
      user = User.first
      expect(user.username).to eq('user9319062')
      expect(user.name).to eq('Denble Xaia')
      expect(user.email).to eq('testes@test.com')
      # expect(user.password).to eq('pass_merde')
      user.destroy!
      expect(User.count).to eq(0)
    end
  end
end