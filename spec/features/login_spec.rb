feature 'Login' do
  scenario 'When a user logs in successfully, a welcome message is displayed on homepage' do
    signup
    logout
    login
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome Alex'
  end

  scenario 'When a user enters wrong credentials, an error message is displayed on login page' do
    login(email: "asdads@asd.com")
    expect(current_path).to eq '/users/login'
    expect(page).to have_content 'Error: Wrong Username or Password'
  end
end
