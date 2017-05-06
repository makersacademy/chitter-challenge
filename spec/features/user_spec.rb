require 'spec_helper'
require_relative 'web_helpers'

feature '#signup', %q{
  As a Maker
  So that I can post messages on Chitter as me
  } do

  scenario 'I want to sign up for Chitter' do
    expect { signup }.to change { User.count }.by(1)
  end
end

feature '#login', %q{
  As a Maker
  So that I can post messages on Chitter as me
  } do

  scenario 'I want to log in to Chitter' do
    user = User.create(username: 'foo', email: 'foo@bar.com', password: '123')
    visit '/'
    fill_in('username', with: 'foo')
    fill_in('password', with: '123')
    click_button('Login')
    expect(page.get_rack_session(:user_id)).to eq user.id
  end
end
