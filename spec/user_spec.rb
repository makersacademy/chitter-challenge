require 'user'
require 'database_helpers'

describe User do
  describe '.register' do
    it 'adds a new User to database' do
      user = User.register(name: 'Faceless Old Woman', \
        user_name: 'FacelessOW', email: 'mystery@domain.com', \
        password: '123456789')

      persisted_data = persisted_data(table: 'users', id: user.id)

      p "user.id is a #{user.id.class}"

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Faceless Old Woman'
      expect(user.user_name).to eq 'FacelessOW'
      expect(user.email).to eq 'mystery@domain.com'
      expect(user.password).to eq '123456789'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.register(name: 'Faceless Old Woman', \
        user_name: 'FacelessOW', email: 'mystery@domain.com', \
        password: '123456789')
      result = User.find(id: user)
      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
