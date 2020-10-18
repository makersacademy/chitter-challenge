require 'user'
require 'test_db'

describe User do
  it 'Creates a new user' do
    truncate_db
    user = User.add(name: 'Amy', username: 'AmelieSK', email: 'adp@gmail.com', password: 'smth')
    expect(user.name).to eq 'Amy'
    expect(user.username).to eq 'AmelieSK'
    expect(user.email).to eq 'adp@gmail.com'
    expect(user.password).to eq 'smth'
    truncate_db
  end

  it 'Shows all users' do
    
  end
end
