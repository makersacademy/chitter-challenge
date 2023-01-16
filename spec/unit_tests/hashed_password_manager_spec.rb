# frozen_string_literal: true

require 'rspec'
require 'bcrypt'
require_relative '../../lib/hashed_password_manager'
describe 'HashedPasswordManager' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end
  # TODO Initializes the Hash password class and returns an instance to be used to either create and check a hashed password

  context 'when condition user_id and password are present HashedPassword Instance is created' do
    example_password = "6545234+13-*/=*+"
    example_user_id = 20
    password = HashedPasswordManager.new(example_user_id, example_password)
    print password
    it 'Should create new instance of hashed password' do
      expect(password).to be_instance_of HashedPasswordManager
    end
    it 'Should return user_id' do
      expect(password.user_id).to eq example_user_id
    end
  end
  context 'when create method is called on hashed_password' do
    example_password = "6545234+13-*/=*+"
    incorrect_example_password = "Incorrect 6545234+13-*/=*+"
    example_user_id = 20
    password_manager_instance = HashedPasswordManager.new(example_user_id, example_password)
    password_manager_instance.create
    password_hash = password_manager_instance.hash
    it 'Should return true when password and hash are correct' do
      expect(password_hash).to include("$")
    end
    it 'Should have instance variable hash' do
      password_check = (BCrypt::Password.new(password_hash) == example_password)
      expect(password_check).to be true
    end
  end
  xcontext 'when check method is called on hashed_password' do
    example_password = "6545234+13-*/=*+"
    example_user_id = 20
    password_manager_instance = HashedPasswordManager.new(example_user_id, example_password)
    password_manager_instance.create
    password_check = password_manager_instance.check(20)
    it 'password should return true' do
      expect(password_check).to be true
    end
  end
end
