require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.add(username: 'RyanGrimes', password: 'password123')
  end
end