require 'spec_helper'

describe User do

  let(:user) { create(:user) }

  it 'contains user' do
    create(:user)
    expect(User.map(&:name)).to include('test user')
    expect(User.first.email).to eq('test@example.com')
  end


  it 'requires confirmation password to be correct' do
    create(:user_wrong_confirmation )
    expect(User).not_to include('test user')
  end

  it 'authenticated when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate incorrect password' do
    expect(User.authenticate(user.email, "incorrect_password")).to be_nil
  end
end