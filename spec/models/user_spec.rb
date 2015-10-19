require 'spec_helper'

describe User do
  let(:user) {create(:user)}

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'WrongPassword')).to be_nil
  end
end
