feature 'Log out User' do
  scenario 'Logs out current user' do
    email, password = "gareth@gmail.com", 'password123'
    user = User.create(name: "Gareth", email: email, password: password)

    visit('users/login')

    expect(current_path).to eq '/users/login'
    login_user(email, password)

    click_link('Log out')
    expect(page).to have_link("Log in")
  end
end
