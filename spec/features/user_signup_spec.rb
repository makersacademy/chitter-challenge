feature 'Signup' do
  scenario 'I can sign up as a new user for the website' do
    expect{ signup }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, AppleMan')
    expect(User.first.email).to eq('steve@coder.com')
  end

  scenario 'I cannot sign up with mismatching passwords' do
    expect{ signup(password_confirmation: 'orange123') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'I cannot sign up using a duplicate username' do
    signup(username:'billGater')
    click_button 'sign out'
    expect{ signup(username: 'billGater', email: 'bill@windows.com') }.not_to change(User, :count)
    expect(page).to have_content("Username is already taken")
  end

  scenario 'I cannot sign up using a duplicate email address' do
    signup(email: "mine@duplicate.com")
    click_button 'sign out'
    expect{ signup(email: "mine@duplicate.com", username: "WindowsMan") }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

  scenario 'I can not sign up without entering an email' do
    expect { signup(email: "") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'I can not sign up using an invalid email format' do
    expect { signup(email: "abcemail.com") }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I should not see sign up page while I am signed in' do
    signup
    click_button 'sign out'
    signin(username: "AppleMan", password: "apple123")
    visit '/users/new'
    expect(page).not_to have_content "Sign up"
  end

end
