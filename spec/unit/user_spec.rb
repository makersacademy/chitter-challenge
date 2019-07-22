require 'database_helpers'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'joe@blogs.co.uk', password: 'password123')

    persisted_data = persisted_data(table: :registration, id: user.id)

    expect(user).to be_a User
    expect(user).to eq persisted_data.first['id']
    expect(user.email).to eq 'joe@blogs.co.uk'
  end
end
