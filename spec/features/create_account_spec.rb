require 'spec_helper'

feature 'As a user' do
  scenario 'you can create your own account' do
    visit "/"
    click_button("Create Account")
    fill_in("email_address", with: "abc@gmail.com")
    fill_in("password", with: "mypass")
    click_button("Submit")
    expect(page).to have_content("Welcome abc@gmail.com")
    expect(page).to have_button("Create Peep")
  end
end
