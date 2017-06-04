require './spec/web_helper.rb'

feature 'User can sign up' do
  scenario 'User is able to sign up for Chitter' do
    sign_up
    expect(page).to have_content('Welcome, cat@example.com!')
    expect(User.first.email).to eq('cat@example.com')
  end

  scenario 'User can not sign in if the password confirmation is not equal to password' do
    sign_up(password_confirmation='different password')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'Password must be at leat 8 characters long' do
    sign_up(password='123', password_confirmation='123' )
    expect(page).to have_content('Password must be at least 8 characters long')
  end

  scenario 'Registered emails are unique' do
    sign_up
    sign_up
    expect(page). to have_content('Email is already taken')
  end

end
