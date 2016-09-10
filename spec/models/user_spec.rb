require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'matt@matt.com', password: 'vickers',
               password_confirmation: 'vickers')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
  expect(User.authenticate(user.email, 'somethingelse')).to be_nil
end

end
