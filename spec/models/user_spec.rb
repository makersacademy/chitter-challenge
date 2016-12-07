require 'spec_helper'

describe User do

  let!(:user) do
    User.create(name: 'Bob',
    username: 'Bobmcbobface',
    email: 'bob@bob.com',
    password: 'pwd')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not allow unauthenticated uses to log in' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end

end
