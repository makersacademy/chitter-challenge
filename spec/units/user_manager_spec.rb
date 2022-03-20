require 'user_manager'

describe UserManager do
  let(:fake_user) { {
    'name' => 'Paul',
    'email' => 'paul@internet.com',
    'password' => 'Tr1ckyPa55w0rd',
    'username' => 'PaulK'
    }
  }
  let(:fake_user_template) { double(:user_class_double, :new => fake_user) }
  let(:fake_db_manager) { double(:db_manager_double, :query => [fake_user]) }
  subject(:user_manager) { described_class.new(fake_db_manager) }
  
  describe '#add' do
    it 'adds a new user to the database' do
      sql_query = "INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4) RETURNING id, email, password, name, username, created"
      user_manager.add(fake_user)
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query, fake_user['email'], fake_user['password'], fake_user['name'], fake_user['username'])
    end
  end
end
