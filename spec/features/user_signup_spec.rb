require 'web_helper'

feature 'signup' do
  scenario 'a user navigates from the home page and fills in personal details' do
    create_account
    visit '/home'
    expect(page).to have_content('Logged in as: Indigo')
  end
end
