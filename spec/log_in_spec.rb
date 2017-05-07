feature 'Users' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'can log in with correct credentials' do
    log_in
    expect(page).to have_content "Hi #{user.email}"
  end

  scenario 'cannot log in with incorrect credentials' do
    log_in(password = 'wrong_password')
    expect(page).not_to have_content "Hi #{user.email}"
    expect(page).to have_content 'The email or password is incorrect'
    expect(page).to have_current_path('/sessions')
  end

end
