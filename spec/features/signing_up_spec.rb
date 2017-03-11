

require 'spec_helper'
require_relative 'web_helpers'

feature 'signing up for Chitter' do

  scenario 'user can sign up for Chitter' do
    expect{sign_up}.to change(User, :count).by(1)
  end

  scenario 'user must confirm with identical password to sign up' do
    expect{sign_up(password_confirmation: 'blitzen')}.to_not change(User, :count)
  end

  scenario 'user must fill in all fields' do
    expect{sign_up(username: nil)}.to_not change(User, :count)
    expect{sign_up(name: nil)}.to_not change(User, :count)
    expect{sign_up(email: nil)}.to_not change(User, :count)
  end

  scenario 'user cannot sign up with already taken username' do
    sign_up
    expect{sign_up(username: 'santaclaus')}.to_not change(User, :count)
  end

  scenario 'user cannot sign up with already taken email' do
    sign_up
    expect{sign_up(email: 'santa@northpole.com')}.to_not change(User, :count)
  end

end
