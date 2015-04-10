require 'spec_helper'

feature 'User can sign up' do
  scenario 'when they are new to the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello George,')
  end

  scenario 'there is a list of all users' do
    sign_up
    sign_up('Ryan', 'me@ryan.com', 'bat')
    visit '/users/all'
    expect(page).to have_content('cat')
    expect(page).to have_content('bat')
  end

  xscenario 'once signed up, their username is displayed on every page' do
    sign_up
    visit '/'
    expect(page).to have_content 'cat'
  end

  scenario 'error will be raised when their email is already registered' do
    sign_up
    sign_up
    expect(page).to have_content('That email is already taken')
  end

  def sign_up(name = 'George', email = 'me@georgemcgowan.com', username = 'cat')
    visit '/'
    fill_in('Name', with: name)
    fill_in('Email', with: email)
    fill_in('Username', with: username)
    click_button('Submit')
  end
end
