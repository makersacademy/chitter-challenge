require 'spec_helper'
require_relative '../../app/models/user.rb'

describe User do

  let!(:test_user) do
    User.create(username: 'Alfie' , email: 'alfie@gmail.com',
                password: 'coding', password_confirmation: 'coding')
  end

  it 'authenticates the user when given a valid email and password' do
    authenticated_user = User.authenticate(test_user.email, test_user.password)
    expect(authenticated_user).to eq test_user
  end
end
