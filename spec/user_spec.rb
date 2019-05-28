require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'peeper@peep.com',
                        password: '123',
                        name: 'Peppy Peep',
                        username: 'Peepqueen')

      persisted_data = persisted_data(id: user.id)

      expect(user).to be_a User
    #  expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'peeper@peep.com'
    end
  end

describe '.find' do

    it 'finds a user by ID' do
    user = User.create(email: 'peeper@peep.com',
                      password: '123',
                      name: 'Peppy Peep',
                      username: 'Peepqueen')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
    expect(result.name).to eq user.name
    expect(result.username).to eq user.username
  end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

  end

end
