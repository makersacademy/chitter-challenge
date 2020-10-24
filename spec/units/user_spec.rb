require 'user'

describe User do

  describe '.set_current_user' do
    it 'sets the current user' do
      user = User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
      User.set_current_user(user)
      rose = User.current_user
      expect(rose.id).to eq user.id
      expect(rose.name).to eq user.name
      expect(rose.username).to eq user.username
      expect(rose.email).to eq user.email
    end
  end

  describe '.create' do
    it 'creates a user' do
      user = User.create(name: "Rose Tyler", username: "badwolf", email: "rtyler@tardis.com", password: "raxacoricofallapatorius")
      data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq data.first['id']
      expect(user.name).to eq data.first['name']
      expect(user.username).to eq data.first['username']
      expect(user.password).to eq data.first['password']
    end
  end

  describe '.find' do
    it 'returns user matching id' do
      user = User.create(name: "Mickey Smith", username: "lonelyboy", email: "mick@brokenheart.com", password: "comebackrose")
      result = User.find(user.id)

      expect(result).to be_a User
      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
      expect(result.email).to eq user.email
      expect(result.password).to eq user.password
    end
  end

end