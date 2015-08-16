feature 'user resets password' do

  scenario 'can select reset password' do
    user = create :user
    sign_in(username: user.username, password: '321')
    expect(page).to have_button "Reset Password"
  end

  scenario 'requesting reset generates a password token' do
    user = create :user
    visit '/user/password_reset'
    fill_in 'email', with: user.email
    click_button 'Reset'
    user = User.first(email: user.email)
    expect(page).to have_content 'Password reset sent'
    expect(user.password_token).not_to be_nil
  end

   scenario 'reset password using token' do
    user = create :user
    user.update(password_token: 'token')
    visit "/password_reset/#{user.password_token}"
    expect(page).to have_content 'New password'
  end

  scenario 'resetting password resets token' do
    user = create :user
    user.update(password_token: 'token')
    visit "/password_reset/#{user.password_token}"
    fill_in 'password', with: '321'
    fill_in 'password_confirmation', with: '321'
    click_button 'Save'
    user = User.first
    visit "/users/password_reset/#{user.password_token}"
    expect(page).not_to have_content 'New password'
  end
end
