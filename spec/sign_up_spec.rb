require 'spec_helper'

feature 'can sign up' do

  scenario 'I can enter my email address' do
    visit '/users/new'
    fill_in :email, with: 'joe@example.com'
    fill_in :password, with: 'joe123'
    fill_in :name, with: 'joe'
    fill_in :username, with: 'joem'
    expect { click_button 'Sign up' }.to change(User, :count).by(1)

   end

end
