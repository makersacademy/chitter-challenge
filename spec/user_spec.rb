require 'spec_helper'

describe User do

  let!(:user) { User.create(username: 'Dennis', email: 'dennis@themenace.ha', password: 'gnasher', password_confirmation: 'gnasher')
    }

  it 'authenticates a user in the db' do
    expect(User.authenticate_user('dennis@themenace.ha', 'gnasher')).to eq user
  end

  it 'does not authenticate a non existent user' do
    expect{User.authenticate_user('not@registered.com', '123456')}.to raise_error "email or password incorrect"
  end

  it 'does not authenticate a user when password is wrong' do
    expect(User.authenticate_user('dennis@themenace.ha', 'ilovewalter')).not_to eq user
  end
end
