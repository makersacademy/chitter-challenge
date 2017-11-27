require 'capybara/rspec'

feature 'Logging in' do
  scenario 'i want to be able to log in with email address and password' do
    visit '/'
    click_button 'Log in!'
    log_in
    expect(page).to have_content 'Start peeping!'
  end
end
