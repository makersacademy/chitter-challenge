require 'spec_helper'

feature 'log in' do
  scenario 'a signed up user can log in' do
    visit '/'
    expect(page).to have_button('Log in')

    User.add(email: 'test@gmail.com', password: 'test123', username: 'Tester 123', name: 'test tester')

    visit '/sessions/new'
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'test123'
    click_button('Log in')

    expect(page).to have_content('Welcome, Tester 123')
  end 
end
