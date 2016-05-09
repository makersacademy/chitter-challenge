require 'web_helper'

feature 'signup' do
  scenario 'a user navigates from the home page and fills in personal details' do
    create_account
    expect(page).to have_content('Logged in as: Indigo')
  end

  scenario 'allows users to create an account' do
    expect{create_account}.to change(User, :count).by(1)
  end
end
