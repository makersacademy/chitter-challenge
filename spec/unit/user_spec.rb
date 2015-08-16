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

  it 'authenticated when given a valid username and password' do
    authenticated_user = User.authenticate(user.user_name, user.password)
    expect(authenticated_user).to eq(user)
  end

  it 'does not authenticate incorrect password' do
    expect(User.authenticate(user.user_name, "incorrect_password")).to be_nil
  end

  it 'only allows unique usernames' do
    user1 = attributes_for(:user)
    user2 = attributes_for(:user)
    User.create(user1)
    User.create(user2)
    expect(User.count).to eq(1)
  end

  it 'only allows unique emails' do
    user1 = attributes_for(:user)
    user2 = attributes_for(:user)
    User.create(user1)
    User.create(user2)
    expect(User.count).to eq(1)
  end
end