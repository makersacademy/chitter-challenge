require 'database_helpers'
require 'users'

describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'chunkylover53@aol.com', password: 'Marge', username: 'Chunkylover53', name: 'Homer Simpson')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'chunkylover53@aol.com'
    expect(user.username).to eq 'Chunkylover53'
    expect(user.name).to eq 'Homer Simpson'
  end
end