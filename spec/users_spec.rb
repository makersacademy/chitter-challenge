require 'users'
require 'database_helpers'

describe Users do

  before do
    truncates
  end

  it 'creates a new user' do
    user = Users.create(name: 'test name', email: 'test@email.com', password: 'pword123', username: 'test_username')
    persisted_data = persisted_data(table: :users, id: user.id)

    p user

    expect(user).to be_a Users
    expect(user.username).to eq 'test_username'
  end
end
