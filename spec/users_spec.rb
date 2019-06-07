require 'user'

describe User do

  it 'can add a user' do
    User.add('Emma', 'emmaturechild', 'test2@test.com', 'test')
    expect(User.all.last.name).to eq ('Emma')
  end

  it 'can return a specific user' do
    users = User.all
    single_user = User.find_by_id(users[0].id)
    expect(single_user.name).to eq 'Kelvin'
  end

  it 'can find a user by username' do
    users = User.all
    single_user = User.find_by_username(users[0].username)
    expect(single_user.name).to eq 'Kelvin'
  end

  it 'can see if a user exists by username' do
    expect(User.user_exists?('kks110')).to eq true
  end

  it 'can see if a user exists by email' do
    expect(User.email_exists?('test@test.com')).to eq true
  end


end
