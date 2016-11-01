require 'spec_helper'
require_relative '../models/user'

describe User do
  context '#login_check' do
    it 'will set redirect to failed-login if user not signed up' do
      User.login_check("the_ceo", "s3cr3t")
      expect(User.redirect).to eq '/failed-login'
    end

    it 'will set redirect to logged in if user has signed up' do
      User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      User.login_check("the_ceo", "s3cr3t")
      expect(User.redirect).to eq '/home'
    end
  end

  context '#new_user_create' do
    it 'will set redirect to re-login if email already exists' do
      User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      expect(User.redirect).to eq '/re-login'
    end

    it 'will set redirect to re-signup if username has already been taken' do
      User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      User.new_user_create("Malinna Leach", "the_ceo", "admin@chitter.com", "s3cr3t")
      expect(User.redirect).to eq '/re-signup?usedname=the_ceo'
    end

    it 'will create new user if all is well' do
      User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      expect(User.first.name).to eq "Malinna Leach"
    end

    it 'will be able to check the encrypted password' do
      user = User.new_user_create("Malinna Leach", "the_ceo", "ceo@chitter.com", "s3cr3t")
      User.password_checker("the_ceo", "s3cr3t")
      expect(User.redirect).to eq '/home'
    end
  end

end
