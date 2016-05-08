require 'spec_helper'
require 'web_helpers'

feature 'new user sign up' do
  scenario 'dont allow duplicate users' do
    create_user_and_peep
    visit ('/register')
    fill_in "name", with: "Mara"
    fill_in "email", with: "mara@gmail.com"
    fill_in "handle", with: "marawanot"
    fill_in "password", with: "password"
    click_button "register"
    expect(current_path).to eq '/new_user'
    expect(page).to have_content "Your email or handle already exists!"
  end
  scenario 'register a new user with unique handle and email' do
    visit ('/register')
    fill_in "name", with: "Mara"
    fill_in "email", with: "mara@hotmail.com"
    fill_in "handle", with: "mara2"
    fill_in "password", with: "password2"
    click_button "register"
    expect(current_path).to eq '/'
    expect(page).to have_content "Handle: mara2"
  end
end

feature 'log in' do
  scenario 'allow user to log in to chitter' do
    create_user_and_peep
    fill_in "handle", with: "marawanot"
    fill_in "password", with: "password"
    click_button "log in"
    expect(current_path).to eq '/'
      expect(page).to have_content "marawanot"
  end
end

feature 'display all peeps' do
  scenario 'display all peeps on wall' do
    create_user_and_peep
      within 'ul#peeps' do
        expect(page).to have_content "Sunday Funday"
      end
  end

  scenario 'display the time a peep was posted' do
    create_user_and_peep
      within 'ul#peeps' do
        expect(page).to have_content "Time: 2016-5-1 [20:15]"
      end
  end
end