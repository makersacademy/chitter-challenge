feature 'User sign in' do

  let!(:user) do
    User.create(email: 'bart@example.com',
                  password: 'password',
                  user_name: 'The Judge'))
  end

  scenario 'log in with correct details' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.user_name}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
