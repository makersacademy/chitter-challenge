require 'spec_helper'

RSpec.feature 'User sign-up' do

  scenario "- user fills out form and creates a new user account" do
    expect{ new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface') }.to change(User, :count).by(1)
  end

  scenario "- fails if user does not enter email address" do
    expect{ new_user_sign_up(nil, '123secret', 'foo', 'Foo McFooface') }.not_to change(User, :count)
  end

  scenario "- fails if user does not enter a password" do
    expect{ new_user_sign_up('foo@foo.com', nil, 'foo', 'Foo McFooface') }.not_to change(User, :count)
  end

  scenario "- welcomes user by their name after sign-up is completed" do
    new_user_sign_up('foo@foo.com', '123secret', 'foo', 'Foo McFooface')
    expect(page).to have_content "Welcome, Foo McFooface!"
  end

  scenario "- keeps the user on the users page if they do not enter their details correctly" do
    new_user_sign_up(nil, nil, nil, nil)
    expect(page).to have_current_path('/users')
  end

  scenario "- shows the user an error if they fail to enter an email address" do
    new_user_sign_up(nil, '123secret', 'foo', 'Foo McFooface')
    expect(page).to have_content("Email must not be blank")
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
