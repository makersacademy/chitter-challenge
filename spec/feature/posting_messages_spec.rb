require_relative '../feature/test_helper'

feature 'posting a message' do
  scenario 'user cannot post a message without logging in' do
    visit '/home'
    expect(page).not_to have_content "What's happening?"
  end

  scenario 'user can post a message' do
    sign_up
    log_in
    fill_in 'new_message', with:'hi'
    click_button 'Chit'
    expect(page).to have_content 'hi'
  end


  scenario 'app does not throw an error when special characters are used' do
    sign_up
    log_in
    fill_in 'new_message', with:"Let's sing!"
    click_button 'Chit'
    expect(page).to have_content "Let's sing!"
  end
end