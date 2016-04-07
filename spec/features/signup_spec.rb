require_relative 'web_helper'

feature 'new user can successfully sign up' do
  scenario 'user tailored message displays' do
    sign_up
    click_button 'Create account'
    expect(page).to have_content "Welcome, TestUser1!"
  end
  scenario 'new user is saved to db' do
    sign_up
    expect{click_button 'Create account'}.to change(User, :count).by(1)
  end
  scenario 'user information is saved to db' do
    sign_up
    click_button 'Create account'
    expect(User.first.email).to eq('test@testmail.com')
    expect(User.first.name).to eq('Bobby Test')
  end
end


feature 'new user is not created if form completed incorrectly' do
  scenario 'mismatching passwords causes error message' do
    sign_up(password_confirmation: 'wrong')
    click_button 'Create account'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'stay on the same page when mismatching passwords entered' do
    sign_up(password_confirmation: 'wrong')
    click_button 'Create account'
    expect(current_path).to eq('/users')
  end

  scenario 'user count does not increase when passwords do not match' do
    sign_up(password_confirmation: 'wrong')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end

  scenario 'user count does not increase if blank email entered' do
    sign_up(email: '')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end

  scenario 'user count does not increase if email is not in email format' do
    sign_up(email: 'someemail.com')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end

  xscenario 'user count does not increase if blank password entered' do
    sign_up(password: '')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end

  scenario 'user count does not increase if blank username entered' do
    sign_up(username: '')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end

  scenario 'user count does not increase if blank name entered' do
    sign_up(name: '')
    expect{click_button 'Create account'}.to change{User.count}.by(0)
  end
end
