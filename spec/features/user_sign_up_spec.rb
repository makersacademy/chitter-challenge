require 'spec_helper'

feature 'A new user signs up to Chitter' do
  scenario 'The user enters their email address and password' do
    expect{sign_up}.to change(User, :count)
  end
end
