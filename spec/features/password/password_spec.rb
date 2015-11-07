feature 'Passwords' do

  Timecop.freeze(Time.now)

  let(:user_with_token) do
    User.create(email: 'user@example.com',
                username: 'Johndoe79',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'are encrypted' do
    user = build(:user)
    sign_up(user)
    expect(BCrypt::Password.new(user.password_digest)).to eq 'password'
  end

  context 'when resetting' do

    scenario 'are timestamped' do
      user = build(:user)
      sign_up(user)
      user.password_token
      expect(user.password_token_timestamp).to eq Time.now
    end

    scenario 'a reset token is issued' do
      visit '/password_reset'
      fill_in 'email', with: user_with_token.email
      click_button 'Reset password'
      user = User.first(email: user_with_token.email)
      expect(user_with_token.password_token).not_to be_nil
      expect(page).to have_content 'Check your emails'
    end

    scenario 'the token will lead to the reset page' do
      user_with_token.save
      visit "/password_reset/#{user_with_token.password_token}"
      expect(page.status_code).to eq 200
      expect(page).to have_content 'Enter a new password'
    end

    scenario '' do
      user_with_token.password_token
      visit "/password_reset/#{user_with_token.password_token}"
      fill_in 'new_password', with: 'blablablalba'
      fill_in 'password_confirmation', with: 'blablablalba'
      click_button 'Reset password'
      expect(page).to have_content 'Password succesfully changed'
    end
  end
end