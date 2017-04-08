feature "user sign in" do

  let!(:user) do
    User.create(email: 'test@test.com', password: '123', password_confirmation: '123')
  end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to log in to Chitter
  scenario "with correct credentials" do
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