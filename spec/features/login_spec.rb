feature 'login to Chitter' do

  let!(:user) do
    User.create(email: 'user@whatever.com', name: 'Dave', password: 'password123')
  end

  scenario 'credentials are correct' do
    sign_up
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome #{user.name}")
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign in'
  end

end
