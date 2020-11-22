require 'user'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'samm@makersacademy.com', password: 'password123', name: 'Sam Morgan', username: 'sjmog')

    # persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.email).to eq 'samm@makersacademy.com'
    expect(user.password).to eq 'password123'
    expect(user.name).to eq 'Sam Morgan'
    expect(user.username).to eq 'sjmog'

  end
end
