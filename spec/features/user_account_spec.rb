require './spec/web_helper.rb'

feature 'User can sign up' do
  scenario 'User is able to sign up for Chitter' do
    sign_up
    expect(page).to have_content('Welcome, cat@example.com!')
    expect(User.first.email).to eq('cat@example.com')
  end

  scenario 'User can not sign in if the password confirmation is not equal to password' do
    sign_up_password_mismatch
    expect(page).to have_content('Password does not match the confirmation')
  end


end
