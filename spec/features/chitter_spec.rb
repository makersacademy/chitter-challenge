require './spec/features/web_helper'

feature Chitter do
  scenario 'add a peep' do
    visit('/')
    fill_in 'peep', with: 'Be yourself; everyone else is already taken.'
    click_button 'Add Peep'
    expect(page).to have_content('Be yourself; everyone else is already taken.')
  end

  scenario 'sign up' do
    visit('/users/new')
    fill_in 'email', with: 'test@example.com'
    fill_in 'pass', with: 'test123'
    click_button 'Submit Details'
    expect(page).to have_content('Welcome, test@example.com')
  end

  fscenario 'sign in' do
    sign_up
    visit('/sessions/new')
    fill_in 'email', with: 'test@example.com'
    fill_in 'pass', with: 'test123'
    click_button 'Sign In'
    expect(page).to have_content('Welcome, test@example.com')
  end

  scenario 'incorrect email on sign in' do
    sign_up
    visit('/sessions/new')
    fill_in 'email', with: 'test2@example.com'
    fill_in 'pass', with: 'test123'
    click_button 'Sign In'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content('Incorrect email or password.')
  end

  scenario 'incorrect password on sign in' do
    sign_up
    visit('/sessions/new')
    fill_in 'email', with: 'test@example.com'
    fill_in 'pass', with: 'test'
    click_button 'Sign In'
    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content('Incorrect email or password.')
  end

end
