require 'user'

describe User do
  it 'creates a user on sign-up' do
    User.sign_up(name:'Greg', username: 'Greg1', email: 'Greg@greg.com', password: 'Greg1')
    expect(User.name).to include 'Greg'
  end
end
