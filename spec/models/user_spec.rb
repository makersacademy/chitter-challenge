require 'spec_helper'
require_relative '../../app/models/user.rb'

describe User do

  let!(:user) do
    User.create(username: 'Alfie' , email: 'alfie@gmail.com',
                password: 'coding', password_confirmation: 'coding')
  end

  it 'authenticates the user when given a valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end
end
