require 'spec_helper'
require './spec/features/web_helpers'

feature '#signup', %q{
  As a Maker
  So that I can post messages on Chitter as me
  } do

  scenario 'I want to sign up for Chitter' do
    expect { signup }.to change { User.count }.by(1)
  end

  scenario '&& a successful signup should not throw an error' do
    signup
    expect(page).not_to have_content('Sorry')
  end

  scenario '&& users cannot choose a username or email that is already taken' do
    user = User.create(name: 'foobar',       username: 'foo',
                       email: 'foo@bar.com', password: '123')
    signup
    expect(page).to have_content('Sorry')
  end
end
