require 'spec_helper'

describe User do

  it 'authenticates when given a valid email address and password' do
    user = User.create(user_name: 'atulord', email: 'test@test.com', password: '1234',
               password_confirmation: '1234')
    user.save
    authenticated_user = User.authenticate('atulord', '1234')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    user = User.create(user_name: 'atulord', email: 'test@test.com', password: '1234',
               password_confirmation: '1234')
    user.save

    expect(User.authenticate(user.user_name, 'wrong_stupid_password')).to be_nil
  end

end
