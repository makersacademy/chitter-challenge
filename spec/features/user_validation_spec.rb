feature 'Validating user information' do

  scenario 'Passwords are checked when logging in' do
    user = create :user
    user.password = 'wrong'
    log_in(user)
    expect(page).to have_content "The username or password is incorrect.
      Please try again."
  end

  scenario 'Emails and usernames must not be already taken at sign-up' do
    create :user
    user = build :user
    sign_up(user)
    expect(page).to have_content "Email is already taken"
    expect(page).to have_content "Username is already taken"
  end
end
