# frozen_string_literal: true
require 'database_helpers'
require 'spec_helper'
require 'bcrypt'

describe User do
  it 'It Responds to #User.create' do
    expect(User).to respond_to(:create)
  end
  it 'Creates a new user' do 
    user = User.create('hello@gmail.com', '1234', 'hi there', 'hello')
    # persisted_data = persisted_data(user.id, "users")
    expect(user).to be_a User
    expect(user.email).to eq 'hello@gmail.com'
  end
  it 'Hashed the password using BCrpyt' do 
    expect(BCrypt::Password).to receive(:create).with('1234')
    User.create('test@example.com', '1234', 'hello hello', 'hello')
  end
end
