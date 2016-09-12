require 'spec_helper'

feature 'signing out' do

  let!(:test_user) do
    User.create(username: 'Alfie' , email: 'alfie@gmail.com',
                password: 'coding', password_confirmation: 'coding')
  end

  scenario 'user can sign out' do
    visit '/sessions/new'
    fill_in('email', with: 'alfie@gmail.com')
    fill_in('password', with: 'coding')
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to have_content('Goodbye, Alfie')
  end
end
