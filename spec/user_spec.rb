require 'user'

describe User do

  it 'saves a new user' do
    User.create("Joe Bloggs", "joe@gmail.com")
    expect(User.all.first.username).to eq "Joe Bloggs"
  end

  it 'allows a user to be logged in as current' do
    User.create("Joe Bloggs", "joe@gmail.com")
    User.set_user("Joe Bloggs")
    expect(User.current_user.username).to eq "Joe Bloggs"
  end

end
