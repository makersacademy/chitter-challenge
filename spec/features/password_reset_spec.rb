feature 'Password reset' do

  let(:user) { create(:user) }

  scenario 'User can verify valid email for password reset' do
    visit '/email_verification'
    fill_in 'email', with: user.email
    click_button 'Verify'
    expect(user.password_token).not_to be_nil
    # expect(SendResetEmail).to receive(:call)
    expect(page).to have_content('Email sent. Please check your email')
  end

  scenario 'User cannot verify email with unregistered email' do
    visit '/email_verification'
    fill_in 'email', with: 'wrong@email.com'
    click_button 'Verify'
    expect(user.password_token).to be_nil
    expect(page).to have_content('Email not found')
  end

  scenario 'resetting password' do
    user.password_token = 'token'
    user.save

    visit "/users/password_reset/#{user.password_token}"
    expect(page.status_code).to eq 200
    expect(page).to have_content('Enter a new password')
    fill_in 'password', with: 'new_password'
    fill_in 'password_confirmation', with: 'new_password'
    click_button 'Reset password'
    expect(page).to have_content('Password is successfully reset')
  end

end
