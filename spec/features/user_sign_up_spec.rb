require 'spec_helper'

RSpec.feature 'User sign-up' do

  scenario "- user fills out form and creates a new user account" do
    expect{ new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface') }.to change(User, :count).by(1)
  end

  scenario "- fails if user does not enter email address" do
    expect{ new_user_sign_up(nil, '123secret', 'foo', 'Foo McFooface') }.not_to change(User, :count)
    expect(page).to have_current_path('/users')
    expect(page).to have_content("Email must not be blank")
  end

  scenario "- fails if user does not enter a password" do
    expect{ new_user_sign_up('foo@foo.com', nil, 'foo', 'Foo McFooface') }.not_to change(User, :count)
    expect(page).to have_current_path('/users')
    expect(page).to have_content("Password must not be blank")
  end

  scenario "- welcomes user by their name after sign-up is completed" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    expect(page).to have_content "Welcome, Foo McFooface!"
  end

  scenario "- prevents user from signing up if email address is already in use" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    expect{ new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface') }.not_to change(User, :count)
  end

  scenario "- prevents user from signing up if username is already in use" do
    new_user_sign_up('bar@foo.com', '123secret', 'foo', 'Foo McFooface')
    expect{ new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface') }.not_to change(User, :count)
  end

end
