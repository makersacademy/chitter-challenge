describe User do

  let(:user_with_token) do
  User.create(email: 'user@example.com',
              username: 'Johndoe79',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

Timecop.freeze(Time.now)

  context 'When signing up' do

    it 'the users password is encrypted' do
      user = build(:user)
      sign_up(user)
      expect(BCrypt::Password.new(user.password_digest)).to eq 'password'
    end

  end

  context 'when resetting password' do

    it 'a password token is timestamped' do
      user = build(:user)
      sign_up(user)
      user.password_token
      expect(user.password_token_timestamp).to eq Time.now
    end
  end

#--------------------------------------------------------------

  scenario 'can request a password reset' do
    visit '/password_reset'
    fill_in 'email', with: user_with_token.email
    click_button 'Reset password'
    user = User.first(email: user_with_token.email)
    expect(user_with_token.password_token).not_to be_nil
    expect(page).to have_content 'Check your emails'
  end

  scenario 'can visit the password reset page' do
    user_with_token.save
    visit "/password_reset/#{user_with_token.password_token}"
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Enter a new password'
  end

  scenario 'can reset the password' do
    user_with_token.password_token
    visit "/password_reset/#{user_with_token.password_token}"
    fill_in 'new_password', with: 'blablablalba'
    fill_in 'password_confirmation', with: 'blablablalba'
    click_button 'Reset password'
    expect(page).to have_content 'Password succesfully changed'
  end
end