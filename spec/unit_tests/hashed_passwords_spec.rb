# frozen_string_literal: true

require 'rspec'
require 'bcrypt'
require_relative '../../lib/hashed_password'
describe 'HashedPassword' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end
  # TODO Initializes the Hash password class and returns an instance to be used to either create and check a hashed password

  context 'when condition user_id and password are present HashedPassword Instance is created' do
    example_password = "6545234+13-*/=*+"
    example_id = 20
    password = HashedPassword.new("20","6545234+13-*/=*+")
    it 'succeeds' do
      expect(password).to be_instance_of HashedPassword
    end
  end
end
