require_relative './spec_helper'
require_relative '../models/user'

RSpec.describe User do
  context "with valid attributes" do
    it "creates a new account" do
      new_user = User.new(
        email: 'coder@cmail.com', 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )
      
      new_user.save

    expect(User.all).to include(
      have_attributes(
        email: 'coder@cmail.com',
        username: 'coder'
      )
    )
    end    
  end

  context "with a missing attribute" do
    it "is not valid" do
      new_user = User.new( 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end

    it "is not valid" do
      new_user = User.new( 
        email: 'coder@cmail.com', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end

    it "is not valid" do
      new_user = User.new( 
        email: 'coder@cmail.com', 
        username: 'coder', 
        password: 'abcde12345'
      )

      expect(new_user).to_not be_valid
    end
  end

  context "with an existing email" do
    it "does not create new record" do
      new_user = User.new(
        email: 'dolly@dmail.com', 
        username: 'coder', 
        password: 'abcde12345', 
        password_confirmation: 'abcde12345'
      )
      
      expect(new_user.save).to eq (false)
    end
  end

  context "with an existing username" do
    it "does not create new record" do
      new_user = User.new(
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
      new_user = User.new(
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