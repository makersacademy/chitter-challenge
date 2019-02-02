require 'user'

describe User do
  before (:each) do
    database_wiper
  end

  it 'can create a user object' do
    test = User.new(username: 'dolly',
      email:  'dolly@aol.com',
      passhash: "ohrighor")
    expect(test).to be_kind_of(User)
  end

  it 'can persist user objects' do
    test = User.create(username: 'dolly',
      email:  'dolly@aol.com',
      passhash: "ohrighor")
    expect(User.all).to include(test)
  end

  it 'stores unique usernames' do
    User.create(username: 'dolly',
      email:  'dolly@aol.com',
      passhash: "ohrighor")

    expect {
      User.create(username: 'dolly',
        email:  'bolly@aol.com',
        passhash: "ohrighor")
    }.to raise_error
  end

  it 'stores unique emails' do
    User.create(username: 'bolly',
      email:  'dolly@aol.com',
      passhash: "ohrighor")

    expect {
      User.create(username: 'dolly',
        email:  'dolly@aol.com',
        passhash: "ohrighor")
    }.to raise_error
  end

end
