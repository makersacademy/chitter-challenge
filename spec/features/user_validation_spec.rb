feature 'Validating user information:' do

  scenario 'Passwords are checked when logging in' do
    user = create :user
    user.password = 'wrongness'
    log_in_as user
    expect(page).to have_content "The handle or password is incorrect."
  end

  scenario 'Emails/handles must not be already taken at sign-up' do
    create :user
    user = build :user
    sign_up_as user
    expect(page).to have_content "Email is already taken"
    expect(page).to have_content "Handle is already taken"
  end

end
