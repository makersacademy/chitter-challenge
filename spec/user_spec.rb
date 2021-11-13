require 'user'

describe User do

  it 'saves a new user' do
    User.create("Joe Bloggs", "joe@gmail.com")
    expect(User.all.first.username).to eq "Joe Bloggs"
  end

end