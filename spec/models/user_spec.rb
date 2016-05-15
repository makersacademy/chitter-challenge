require 'spec_helper'

describe User do
  let!(:user) do
    User.create(name: 'Foo Bar',
      username: 'fooby',
      email: 'foo@bar.com',
      password: 'foobar',
      password_confirmation: 'foobar')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
   expect(User.authenticate(user.email, 'azerty')).to be_nil
  end
  
end