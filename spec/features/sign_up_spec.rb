require 'spec_helper'

feature 'signing up' do

  scenario 'a user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'a user is not signed up when the password confirmation is incorrect' do
    expect { sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
  end
  
end
