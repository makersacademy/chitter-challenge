require 'user'

describe 'create' do
  it 'creates a new user' do
    user = User.create(username: 'CRISPR', email: 'crispr@yahoo.com', password: '123456')
    
    expect(user).to be_a User
    expect(user.username).to eq 'CRISPR' 
    expect(user.email).to eq 'crispr@yahoo.com'
  end
end