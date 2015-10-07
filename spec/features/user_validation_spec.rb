feature 'Validating user information' do

  scenario 'Passwords are checked when logging in' do
    user = create :user
    user.password = 'wrong'
    log_in(user)
    expect(page).to have_content "The username or password is incorrect. Please try again."
  end


end
