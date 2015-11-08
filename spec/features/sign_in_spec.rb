feature 'User sign in' do

  let(:user) do
    User.create(email: 'user@example.com',
              password: 'secret123',
              password_confirmation: 'secret123')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sign_in'
    fill_in 'email', with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end