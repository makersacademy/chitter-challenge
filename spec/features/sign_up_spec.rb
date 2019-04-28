require 'capybara/rspec'

feature 'Sign up' do
  scenario 'Allow user to sign up for chitter' do
    visit('/')
    expect(page).to have_button 'Sign up'
  end
end
