require 'user'

describe User do
  describe '.create' do
    it 'creates a user' do
      user = User.create(name: "Ramona Garcia", username: "safada", email: "ramona@emaas.com", password: "ramonawhat")
      data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq data['id']
      expect(user.name).to eq data['name']
      expect(user.username).to eq data['username']
      expect(user.password).to eq data['password']
    end
  end

  describe '.find' do
    it 'returns user matching id' do
      user = User.create(name: "Ronny Santos", username: "tattomaker", email: "tattoos@rony.com", password: "iamsogood")
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