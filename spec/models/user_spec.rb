require 'web_helper'
require './app/models/user'
require 'spec_helper'

describe User do

  let!(:user) do
    User.create(name: 'Kate McCaffrey',
                user_name: 'Mac',
                email: 'mac@shaper.com',
                password: 'netrunner1')
  end

  it 'will authenticate when a user enters the correct email address and password' do
    authenticated_user = User.authenticate('mac@shaper.com', 'netrunner1')
    expect(authenticated_user).to eq user
  end

  it 'will not authenticate when a user enters the incorrect password' do
    expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
  end

end
