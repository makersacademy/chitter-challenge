feature 'homepage' do
  scenario 'expect homepage to have header, textbox and submit button' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Sign up"
    expect(page).to have_content "Sign in"
    expect(page.current_path).to eq '/'
  end
  feature 'signup' do
    scenario 'A user can signup' do
      signup
      expect(page).to have_content 'You signed up successfully!'
      expect(page).to have_content 'Welcome, Test'
    end

    scenario 'a user must have a unique email' do
      signup
      click_button 'Log out'
      signup
      expect(page).to have_content 'Error! Want to sign up or sign in?'
      expect(page.current_path).to eq '/error'
    end
  end

  scenario 'A user can signin' do
    signup
    expect(page).to have_content 'You signed up successfully!'
    expect(page).to have_content 'Welcome, Test'
  end

  feature 'logout' do
    scenario 'a user can log out' do
      signup
      click_button 'Log out'
      expect(page).to have_content "Chitter"
      expect(page).to have_content "Sign up"
      expect(page).to have_content "Sign in"
      expect(page.current_path).to eq '/'
    end
  end
end
