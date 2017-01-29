# in /spec/models/user_spec.rb
require 'spec_helper'
require 'web_helper'

describe User do

  let!(:user) do
    User.create(user_email: 'test@test.com', password: 'secret1234',
               password_confirmation: 'secret1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.user_email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.user_email, 'wrong_stupid_password')).to be_nil
  end

end
