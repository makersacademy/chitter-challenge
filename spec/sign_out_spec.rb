require 'spec_helper'

feature 'Signing out existing users' do
  before(:each) do

  User.create(name: 'James', email: 'james@hello.com',
              username: 'jamesman', password: '1234',
              password_confirmation: '1234')
  end

  scenario 'An exisitng user can sign out' do
    sign_in

    click_button('Log out')
    expect(page).to have_content('Thank you and see you soon!')
    expect(page).not_to have_content("Welcome, James!")
    expect(current_path).to eq '/peeps'
  end
end
