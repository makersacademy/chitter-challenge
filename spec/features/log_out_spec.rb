require './web_helper'

feature 'User signs out' do

  before(:each) do
    User.create(email: 'bartjudge@gmail.com',
                password: 'password',
                password_confirmation: 'password',
                user_name: 'The Judge')
  end

  scenario 'while being signed in' do
    sign_in(email: 'bartjudge@gmail.com', password: 'password')
    click_button 'Sign out'
    expect(page).to have_content('Come Back soon!')
    expect(page).not_to have_content('Welcome, #{user.user_name}')
  end

end
