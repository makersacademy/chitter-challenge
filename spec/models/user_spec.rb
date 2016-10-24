require 'spec_helper'

describe User do

  let!(:user) do
    User.create(name: 'Sally Went',
                user_name: 'sallywent1990',
                email: 'sillysally@yahoo.com',
                password: 'ginger123',
                password_confirmation: 'ginger123')
  end

  it 'authenticates the acount when given the correct email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'doesn\'t authenticate when incorrect password is given' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end

end
