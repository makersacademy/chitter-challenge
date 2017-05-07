require 'spec_helper'
require './spec/features/web_helpers'

feature '#login', %q{
  As a Maker
  So that I can post messages on Chitter as me
  } do

  scenario 'I want to log in to Chitter' do
    User.create(name:  'foobar',      username: 'foo',
                email: 'foo@bar.com', password: 'password1')
    login
    expect(page).to have_content('foo')
  end

  scenario '&& unregistered users should not be able to log in' do
    login
    expect(page).to have_content('Sorry')
  end
end

feature '#logout', %q{
  As a Maker
  So that I can avoid others posting messages on Chitter as me
  } do

  scenario 'I want to log out of Chitter' do
    login
    click_button('Logout')
    expect(page).not_to have_content('foo')
  end
end
