feature 'Validating user information:' do

  scenario 'Passwords are checked when logging in' do
    user = create :user
    user.password = 'wrongness'
    log_in_as user
    expect(page).not_to have_content "You are logged in as #{name_handle(user)}"
  end

  # scenario 'Passwords are checked when logging in' do
  #   user = create :user
  #   user.password = 'wrongness'
  #   log_in_as user
  #   expect(page).not_to have_content "You are logged in as #{name_handle(user)}"
  # end

end
