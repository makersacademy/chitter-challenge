require_relative '../spec_helper'
require_relative '../../models/user'

RSpec.describe User do
  before :each do 
    user = User.create(
      first_name: 'Dolly',
      last_name: 'See',
      email: 'dolly@dmail.com',
      username: 'dolly',
      password: 'abcde12345',
      password_confirmation: 'abcde12345'
    )
  end

  context "with valid attributes" do
    it "creates a new account" do
      new_user = User.create(
        first_name: 'Narae',
        last_name: 'Kim',
        email: 'coder@cmail.com', 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )
      
      expect(new_user.save).to eq true
    end    
  end

  context "with a missing attribute" do
    it "is not valid" do
      new_user = User.create( 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end

    it "is not valid" do
      new_user = User.create( 
        email: 'coder@cmail.com', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end

    it "is not valid" do
      new_user = User.create( 
        email: 'coder@cmail.com', 
        username: 'coder', 
        password: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end
  end

  context "with an existing email" do
    it "does not create new record" do
      new_user = User.create(
        first_name: 'Coder',
        last_name: 'Kata',
        email: 'dolly@dmail.com', 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )
      
      expect(new_user.errors.objects.first.full_message).to eq ('Email has already been taken')
    end
  end

  context "with an existing username" do
    it "does not create new record" do
      new_user = User.create(
        email: 'coder@cmail.com', 
        username: 'dolly', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )
      
      expect(new_user.save).to eq (false)
    end
  end

  context "with a short password" do
    it "does not create new record" do
      new_user = User.create(
        email: 'coder@cmail.com', 
        username: 'coder', 
        password: 'abcde', 
        password_confirmation: 'abcde'
      )

      expect(new_user.save).to eq (false)
    end
  end

  context "with unmatched password confirmation" do
    it "does not create new record" do
      new_user = User.new(
      email: 'coder@cmail.com', 
      username: 'dolly', 
      password: 'abcde12345', 
      password_confirmation: 'abcde12'
    )
    
    expect(new_user.save).to eq (false)
    end
  end
end