require 'users'

describe Users do
  it 'can find a user by id' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    expect(Users.all.find(1)).to eq user
  end
end
