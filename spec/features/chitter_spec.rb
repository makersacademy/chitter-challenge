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
    fill_in 'name', with: 'charlene'
    fill_in 'pass', with: 'test123'
    click_button 'Submit Details'
    expect(page).to have_content('Welcome, test@example.com')
  end
end
