require_relative 'web_helper'

feature 'When visiting the signup page' do

  scenario 'I can  see a signup form, enter an email and password and submits the form' do
    # As a Maker
    # So that I can post messages on Chitter as me
    # I want to sign up for Chitter
    sign_up
    expect(User.first.email_address).to eq('HarryBCDresden@aol.com')
    expect(User.first.real_name).to include('Harry Blackstone Copperfield Dresden')
    expect(User.first.username).to include ('Hoss')
    expect(page).to have_content("Hey Harry, let's peep together!")

  end

end
