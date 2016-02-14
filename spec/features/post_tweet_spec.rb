require 'spec_helper'

feature 'post tweet as a user' do

  before do
    User.create(email: 'test@test.com',
                password: 'password123',
                password_confirmation: 'password123')
    end

  scenario 'post tweets' do
    visit '/login'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'password123'
    click_button 'log in'
    visit '/post_tweet'
    fill_in :message, with: 'asdfgh'
    click_button 'submit'
    expect(current_path) == ('/home')
    # expect(page).to have_content('asdfgh')
  end

  scenario 'see tweets in reverse chronological order' do
    visit '/login'
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'password123'
    click_button 'log in'
    visit '/post_tweet'
    fill_in :message, with: 'asdfgh'
    click_button 'submit'
    expect(current_path) == ('/home')
    visit '/home'
    expect(page).to have_content('asdfgh')

  end

end
