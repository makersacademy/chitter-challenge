require 'spec_helper'

feature 'signing in' do

  let!(:user) do
    User.create(username: 'Alfie' , email: 'alfie@gmail.com',
                password: 'coding', password_confirmation: 'coding')
  end

  scenario 'user can sign in' do
    visit '/sessions/new'
    fill_in('email', with: 'alfie@gmail.com')
    fill_in('password', with: 'coding')
    click_button 'Sign in'
    expect(page).to have_content('Welcome, Alfie')
  end

end
