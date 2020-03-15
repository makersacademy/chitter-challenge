require 'spec_helper'

feature 'registration' do
   xscenario 'user can setup an account' do
    visit('/register')
    fill_in('username', with: "testusername")
    fill_in('email', with: 'testemail@gmail.com')
    fill_in('name', with: 'testname')
    fill_in('password', with: 'testpassword')
    click_button("Submit")

    expect(page).to have_content('testusername', 'testname')
  end
end
