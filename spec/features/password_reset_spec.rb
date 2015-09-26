feature 'Password reset' do
  scenario 'User can verify valid email for password reset' do
    user = create(:user)
    visit '/email_verification'
    fill_in 'email', with: user.email
    click_button 'Verify'
    expect(user.password_token).not_to be_nil
    expect(page).to have_content('Email sent. Please check your email')
  end

  scenario 'User cannot verify email with unregistered email' do
    user = create(:user)
    visit '/email_verification'
    fill_in 'email', with: 'wrong@email.com'
    click_button 'Verify'
    expect(user.password_token).to be_nil
    expect(page).to have_content('Email not found')
  end
end
