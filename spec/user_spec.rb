require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(username: "user001", password: 'password123')
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.query("SELECT * FROM users")

    expect(user).to be_a User
    expect(user.username).to eq 'user001'
    expect(user.id).to eq result.first['id']
  end
end
