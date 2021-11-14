require 'user'

describe '#create' do
  it 'creates a new user' do
    connection = PG.connect(dbname: 'chitter_users_test')
    user = User.add('RyanGrimes', 'password123')
  end
end
