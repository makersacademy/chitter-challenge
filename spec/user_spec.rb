require 'user'

RSpec.describe '.create' do
  it 'creates a new user' do
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(email: "test@example.com", password: "password123", username: "test12")

    users = connection.exec("SELECT * FROM users WHERE id = $1;", [user.id])

    expect(user).to be_a User
    expect(user.id).to eq users.first['id']
    expect(user.email).to eq 'test@example.com'
    expect(user.username).to eq 'test12'
  end
end