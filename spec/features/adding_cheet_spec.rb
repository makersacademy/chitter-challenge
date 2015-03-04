require 'spec_helper'

feature "User can add a cheet" do

  scenario "after opening the home page" do
    sign_up
    sign_in('paul@example.com', 'paul')
    visit('/')
    add_cheet("My first cheet")
    expect(page).to have_content("My first cheet")
   end

  def sign_in(email, password)
    visit('/sessions/new')
    fill_in :email, :with => email
    fill_in :password, :with => password
    click_button 'Sign in'
  end

  def add_cheet(text)
    fill_in :text, :with => text
    click_button 'Add cheet'
  end

  def sign_up(name = "Paul",
              password ="paul",
              password_confirmation = "paul",
              username = "paulychops",
              email = "paul@example.com")
    visit('/users/new')
    expect(page.status_code).to eq(200)
    fill_in :name, :with => name
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    fill_in :username, :with => username
    fill_in :email, :with => email
    click_button "Sign up"
  end
end

