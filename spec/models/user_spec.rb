require 'spec_helper'
require './app/models/user'

describe User do
  let!(:user) { create :user }

  it 'can login with valid username and password' do
    loggedin_user = User.login(user.username, user.password)
    expect(loggedin_user).to eq user
  end

  it 'cannot login with invalid password' do
    expect(User.login(user.name, 'wrong password')).to be_nil
  end

end
