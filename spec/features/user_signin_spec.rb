feature 'User Log In' do
  scenario 'Displays Log In screen' do
    visit '/'
    click_button("Sign In")
    expect(current_path).to eq('/signin')
  end

  scenario 'Username/password error' do
    sign_in_incorrect_password
    expect(current_path).to eq('/signin')
  end

  scenario 'Successful sign in' do
    sign_up_correctly
    sign_in_correctly
    expect(current_path).to eq('/')
    within 'div#mainbar' do
      expect(page).to have_content("Hi, Paul!")
      expect(page).not_to have_button("Sign In")
    end
  end

  scenario 'Failed sign in' do
    sign_up_correctly
    sign_in_incorrect_password
    expect(current_path).to eq('/signin')
    within 'div#signinform' do
      expect(page).to have_content("Invalid username or password")
    end
  end

end
