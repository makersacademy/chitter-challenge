require 'spec_helper'


RSpec.feature 'User sign up', type: feature do
  scenario 'new users are able to sign up to chiiter' do
    visit '/'
    expect(page.status_code).to be(200)

    click_button 'Sign Up'

    expect(page).to have_content('Cheers for choosing Chitter')
    expect(page).to have_content('Please fill out the form below to sign up to Chitter')
  end
end

RSpec.feature 'Adding a new user', type: feature do
  scenario 'a new user is added to the database' do
    visit '/'
    expect(page.status_code).to be(200)

    click_button 'Sign Up'

    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Howdy, j.smith90')
    expect(User.first.email).to eq('john.smith@example.co.uk')
  end
end
