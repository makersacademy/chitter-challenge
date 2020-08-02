require_relative '../spec_helper'

feature 'sign in' do

  let(:user) {  User.create(name: 'test', email: 'test@test.com', password: 'password123') }

  scenario 'a user is able to sign in' do

    user
    visit '/'
    fill_in 'login_name', with: 'test'
    fill_in 'login_email', with: 'test@test.com'
    fill_in 'login_password', with: 'password123'
    click_button 'login'

  end

end
