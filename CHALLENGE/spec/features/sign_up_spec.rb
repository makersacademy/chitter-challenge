require 'spec_helper'

feature 'Signing up' do

  scenario 'there is an option to sign up on the home page' do
    visit '/homepage'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Join the Chitter community'
  end

  scenario 'a user can sign up and are directed to their own login page' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'username'
    expect(User.first.email).to eq('e-mail@e-mail.com')
  end

end
