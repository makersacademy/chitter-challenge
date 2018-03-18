require 'web_helpers'

feature 'log in' do
  scenario 'with a registered email and correct password' do
    sign_in_correct
    expect(page).to have_content 'You are logged in as tom@hotmail.com'
  end
  scenario 'with a registered email and incorrect password' do
    sign_in_incorrect
    expect(page).to have_content 'Login Combination not found'
  end
end

feature 'sign up' do
  scenario 'User is made aware that they have signed up' do
    sign_up_new
    expect(page).to have_content 'Hi freddy@hotmail.com, you have been signed up to Chitter!'
end
  scenario 'If user already exists raise an error' do
    sign_up_existing
    expect(page).to have_content 'Login User already exists'
  end
  scenario 'If email is in incorrect format raise error' do
    sign_up_bad_format
    expect(page).to have_content 'Login Incorrect format'
  end
end
