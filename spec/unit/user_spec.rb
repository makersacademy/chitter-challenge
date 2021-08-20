require 'user'

describe User do
  
  it 'creates a new user object with name' do
    user = User.create('Ed')
    expect(user.name).to eq 'Ed'
  end
  
end