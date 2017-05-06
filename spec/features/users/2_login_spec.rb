require 'spec_helper'
require './spec/features/web_helpers'

feature '#login', %q{
  As a Maker
  So that I can post messages on Chitter as me
  } do

  scenario 'I want to log in to Chitter' do
    User.create(name:  'foobar',      username: 'foo',
                email: 'foo@bar.com', password: '123')
    visit '/'
    fill_in('username', with: 'foo')
    fill_in('password', with: '123')
    click_button('Login')
    expect(page).to have_content('foo')
  end

  scenario '&& unregistered users should not be able to log in' do
    visit '/'
    fill_in('username', with: 'foo')
    fill_in('password', with: '123')
    click_button('Login')
    expect(page).to have_content('Sorry')
  end
end
