feature 'User login in' do

  let!(:user) do
    User.create(username: 'chun-li',
                email: 'chun-li@streetfighter.com',
                password: 'securepassword',
                password_confirmation: 'securepassword')
  end

  scenario 'Logs user in' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}."
  end

  def log_in(email:, password:)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log In'
  end
end
