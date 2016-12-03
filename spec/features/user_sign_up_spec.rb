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
    expect{ new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface') }.to change(User, :count).by(1)
  end

  scenario "- user does not enter email address" do
    expect{ new_user_sign_up(nil, '123secret', 'foo', 'Foo McFooface') }.not_to change(User, :count)
  end

end
