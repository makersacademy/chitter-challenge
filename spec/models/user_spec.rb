require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'dylan@bossman.com', password: 'bossman', password_confirmation: 'bossman', username: 'dylanrhodius', name: 'dylan rhodius')
  end

  it 'Authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'Does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'wrong_passowrd')).to be_nil
  end

end
