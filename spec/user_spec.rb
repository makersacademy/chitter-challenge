require 'user'
require 'database_helpers'

 describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Muge Hasilci', email: 'muge.hasilci@hotmail.com', password: 'kizkulesi')
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Muge Hasilci'
      expect(user.email).to eq 'muge.hasilci@hotmail.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
    user = User.create(name: 'Muge hasilci', email: 'muge.hasilci@hotmail.com', password: 'kizkulesi')
    result = User.find(id: user.id)

    expect(result.id).to eq user.id
    expect(result.name).to eq user.name
    expect(result.email).to eq user.email
  end

  it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
  end
end
 end
