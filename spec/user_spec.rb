require 'user'

describe '.add' do
  it 'add user information' do
    user =  User.add('jeff123', 'jeff', 'test@gmail.com', 'password123')
    # expect(Bookmarks.all).to include('http://facebook.com')
    expect(User.all).to include user
  end
end
