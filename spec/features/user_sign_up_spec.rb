require 'spec_helper'

RSpec.feature 'User sign-up' do

  scenario "- user visits sign-up page and sees sign-up form" do
    visit '/users/new'
    expect(page).to have_content "Email:"
    expect(page).to have_content "Password:"
    expect(page).to have_content "Username:"
    expect(page).to have_content "Name:"
  end

  scenario "- user fills out form and creates a new user account" do
    visit '/users/new'
    fill_in :email, with: 'foo@foo.com'
    fill_in :password, with: '123secret'
    fill_in :username, with: 'foo'
    fill_in :name, with: 'Foo McFooface'
    click_button 'Submit'
    expect(User.count).to be 1
  end

end
