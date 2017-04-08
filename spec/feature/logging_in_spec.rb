feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
  end

  scenario 'Signing in' do
    sign_in(email: 'test@test.com',   password: 'password')
    expect(page).to have_content "Welcome, 'test@test.com'"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
