require 'web_helpers'

feature 'Authentication' do
  scenario 'user logs in using username and password' do
    register
    fill_in('username', with: 'dack')
    fill_in('password', with: 'password123')
    click_button('Sign in')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Logged in as: @dack'
  end

  scenario 'a user sees an error if they enter a username that isnt registered' do
    register
    fill_in('username', with: 'jack')
    fill_in('password', with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Logged in as: @jack'
    expect(page).to have_content 'Please check your username or password'
  end

  scenario 'a user sees an error if they enter the incorrect password' do
    register
    fill_in('username', with: 'dack')
    fill_in('password', with: 'password456')
    click_button('Sign in')

    expect(page).not_to have_content 'Logged in as: @jack'
    expect(page).to have_content 'Please check your username or password'
  end

  scenario 'a user can sign out' do
    register_and_sign_in

    click_button('Sign out')

    expect(page).not_to have_content 'Logged in as: @jack'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
