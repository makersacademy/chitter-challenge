require 'capybara/rspec'

feature 'Signing in' do
  scenario 'the user can see empty input fields for username and password, and sign-in button' do
    visit('/')
    expect(page).to have_button('Sign in')
  end
  # scenario 'user can sign in' do
  #   visit('/')
  #   fill_in('username', with: 'paosch')
  #   fill_in('password', with: 'Sol10')
  #   click_on 'Sign in'
  #   expect(page).to have_content "Hi, paosch, write a peep!"
  # end
end
