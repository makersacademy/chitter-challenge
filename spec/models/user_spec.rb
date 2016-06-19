require 'spec_helper'

describe User do

  let!(:user) do
    User.create(email: 'shogun@katana.com', password: 'harakiri!', password_confirmation: 'harakiri!')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'you_shall_not_pass')).to be_nil
  end

end