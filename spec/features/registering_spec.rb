require_relative './web_helpers.rb'

describe 'users can register to post', type: :feature do
  scenario 'a visitor visits messages page and registers to post' do
    visit '/messages'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'ui_password', with: 'trex89D!'
    fill_in 'ui_password1', with: 'trex89D!'
    fill_in 'email', with: 'arvo@gmail.com'
    click_button 'submit'
    expect(page).to have_button 'write message' 
  end

  scenario 'a visitor that has not registered or logged in views messages' do
    visit '/messages'
    expect(page).not_to have_content 'write message'
  end

  scenario 'a visitor attempts to register with an invalid email' do
    visit '/messages'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'ui_password', with: 'trex89D'
    fill_in 'ui_password1', with: 'trexD89'
    fill_in 'email', with: 'random_gibberish'
    click_button 'submit'
    expect(page).to have_content 'ERROR: Invalid email'
  end

  scenario 'a visitor attempts to register with a username that is taken' do
    register
    click_button 'log out'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'ui_password', with: 'trex89D'
    fill_in 'ui_password1', with: 'trex89D'
    fill_in 'email', with: 'another@gmail.com'
    click_button 'submit'
    expect(page).to have_content 'ERROR: username not available'
  end

  scenario 'a visitor attempts to register with an email that has already been used' do
    register
    click_button 'log out'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvi_k'
    fill_in 'ui_password', with: 'trex89D'
    fill_in 'ui_password1', with: 'trex89D'
    fill_in 'email', with: 'arvo@gmail.com'
    click_button 'submit'
    expect(page).to have_content 'ERROR: email has already been used'
  end

  scenario 'a visitor attempts to register with non-matching passwords' do
    visit '/messages'
    click_button 'sign up'
    fill_in 'first_name', with: 'Arvo'
    fill_in 'last_name', with: 'Kalns'
    fill_in 'username', with: 'arvo_k'
    fill_in 'ui_password', with: 'trex89D'
    fill_in 'ui_password1', with: 'trex89'
    fill_in 'email', with: 'arvo@gmail.com'
    click_button 'submit'
    expect(page).to have_content 'ERROR: passwords not matching'
  end
end
