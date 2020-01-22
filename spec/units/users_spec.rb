require 'users'

describe Users do
  it 'can find a user by id' do
    user = Users.create(username: 'name1', email: 'test@me.com', password: 'password123')
    found_user = Users.find(1)
    expect(found_user.id).to eq user.id
    expect(found_user.email).to eq user.email
    expect(found_user.username).to eq user.username
  end

  it '.find method returns nil if no user given' do
    expect(Users.find(nil)).to eq nil
  end
end
