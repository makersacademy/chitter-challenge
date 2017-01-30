require 'spec_helper'

feature 'Login' do
  scenario 'User can login to Chitter' do
    user = User.new(name: 'Gurminder', username: 'Gus', password: 'test',
             password_confirm: 'test', email: 'test@test.com')
    user.save
    visit '/'
    click_link 'Login'
    fill_in 'username', with: 'Gus'
    fill_in 'password', with: 'test'
    click_button 'Login'
    expect(page).to have_content 'Welcome to Chitter Gurminder'
  end
end
