require 'spec_helper'
require_relative 'web_helpers'

feature 'signing up for Chitter' do

  scenario 'user can sign up for Chitter' do
    expect{sign_up}.to change(User, :count).by(1)
  end

  scenario 'user must confirm with identical password to sign up' do
    expect{sign_up(password_confirmation: 'blitzen')}.to_not change(User, :count)
  end

end
