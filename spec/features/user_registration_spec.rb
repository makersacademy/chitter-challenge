require 'spec_helper'
require 'web_helper'

feature 'registration' do
  scenario 'a user can sign up' do
    sign_up

    expect(page).to have_content 'Welcome, Simona'
  end

  scenario 'a user cannot sign up with an existing email' do
    sign_up

    visit '/users/new'
    fill_in('name', with: 'Testname')
    fill_in('username', with: 'testsurname')
    fill_in('email', with: 'simona.gioe88@gmail.com')
    fill_in('password', with: 'pass123')
    click_button('Submit')

    expect(page).to have_content 'Email already existing. Please log in'
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'a user cannot sign up with an existing username' do
    sign_up

    visit '/users/new'
    fill_in('name', with: 'Testname')
    fill_in('username', with: 'Airies')
    fill_in('email', with: 'testemail')
    fill_in('password', with: 'pass123')
    click_button('Submit')

    expect(page).to have_content 'Username already in use.'
    expect(current_path).to eq '/users/new'
  end
end
