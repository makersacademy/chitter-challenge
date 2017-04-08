feature 'User sign in' do
  let!(:user) do
    User.create(name: 'Pete Smith', email: 'pete@example.com', username: 'peteypops', password: 'password123', password_confirmation: 'password123')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
