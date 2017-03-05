require 'spec_helper'

describe User do
  let!(:user) { User.create(email: 'johndoe@internet.com', name: 'John Doe', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  it '#authenticate works with correct email & password' do
    authenticated = User.authenticate(user.email, user.password)
    expect(authenticated).to eq user
  end

  it '#authenticate fails with incorrect email & password' do
    expect(User.authenticate(user.email, 'me_drunk')).to be nil
  end
end
