require 'user'
require 'database_helpers'

describe User do
  describe '.register' do
    it 'adds a new User to database' do
      user = User.register(name: 'Faceless Old Woman', \
        user_name: 'FacelessOW', email: 'mystery@domain.com', \
        password: '123456789')

      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.name).to eq 'Faceless Old Woman'
      expect(user.user_name).to eq 'FacelessOW'
      expect(user.email).to eq 'mystery@domain.com'
      expect(user.password).to eq '123456789'
    end
  end
end
