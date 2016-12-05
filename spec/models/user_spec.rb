require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'secret12345', password_confirm: 'secret12345')
  end

  it 'Authenticates when password and email are valid' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'Does not authenticate when given incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end
