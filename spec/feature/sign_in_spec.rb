feature 'User sign in' do
  let!(:user) do
    User.create(email: 'test@example.com', password: 'pass',
    password_confirmation: 'pass', user_id: 'reena', user_name: 'Reena Sharma')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
