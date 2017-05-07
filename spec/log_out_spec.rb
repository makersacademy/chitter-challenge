feature 'Users' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'when not signed in' do
    visit '/'
    expect(page).not_to have_button 'Sign Out Now!'
  end

  scenario 'can log out after logging in' do
    log_in
    click_button 'Log Out'
    expect(page).to have_content "Goodbye #{user.email}"
    expect(page).not_to have_content "Welcome #{user.email}"
  end

end
