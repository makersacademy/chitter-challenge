require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  it 'authenticates when given a valid username and password' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'onion')).to be_nil
  end

  it 'does not authenticate when given an incorrect username' do
    expect(User.authenticate('bob', user.password)).to be_nil
  end

  it 'fails when creating a user whos email already exisits' do
    expect(User.create(email: user.email, username: 'jimmy', password: "654321", password_confirmation: "654321", name: "jim").errors.full_messages).to include "Email is already taken"
  end

end