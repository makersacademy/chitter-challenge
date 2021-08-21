require 'user'

describe User do
  
  it 'creates a new user object with name' do
    user = User.create('Ed', 'x', 'x', 'x')
    expect(user.name).to eq 'Ed'
  end

  it 'connects to database' do
    expect(User.connect_to_db).to be_a(PG::Connection)
  end

end
