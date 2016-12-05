require_relative '../app/models/user'

describe User do

  let!(:user) do
    User.create(name: "Will Jones",
                            email: "wjones@gmail.com",
                            username: "wjones",
                            password: 'pizza123',
                            password_confirmation: 'pizza123')
  end

  it 'authenticates a user with the correct credentials' do
    authenticated_user = User.authenticate(user.username,user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate a user with incorrect password' do
    expect(User.authenticate(user.username,"wrong password")).to eq nil
  end

  it 'does not authenticate a user with incorrect username' do
    expect(User.authenticate("wrong username",user.password)).to eq nil
  end



end
