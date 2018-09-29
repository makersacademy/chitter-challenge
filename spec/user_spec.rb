require 'user'
#require 'setup_test_database'

describe User do
  describe '.create' do
    it 'creates a new user' do
      setup_user_database
      conn = PG.connect(dbname: 'peeps_test')
      new_user = User.create(name: 'Nazz Kadri', username: 'nazzk', email: 'test@example.com', password: 'password123')
      expect(new_user).to be_a(User)
      expect(new_user).to respond_to(:username)
      expect(new_user.email).to eq 'test@example.com'

      # persisted_user = persisted_data(table: :users, id: new_user.id).first
      # expect(new_user.id).to eq persisted_user.id
      # expect(new_user.email).to eq 'test@example.com'
      # expect(new_user.email).to eq persisted_user.email
    end
  end
end
