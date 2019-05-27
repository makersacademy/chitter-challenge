require 'user'
require 'data_helpers'

describe '.create' do
  it 'creates new user' do
    user = User.create(email: 'peep4peep@chitter.co.uk', password: 'peepispeepbackwards')

    persisted_data = persisted_data(id: user.id, table: 'users')

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'peep4peep@chitter.co.uk'
  end
end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'peep4peep@chitter.co.uk', password: 'peepispeepbackwards')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
 end