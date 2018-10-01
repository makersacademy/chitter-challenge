feature 'logout' do
  context 'when logged out' do
    scenario 'logout form not present if logged out' do
      visit('/')
      expect(page).not_to have_button('Log out')
    end

    scenario 'login register form is present' do
      visit('/')
      expect(page).to have_button('Login')
      expect(page).to have_button('Register')
    end
  end

  context 'when logged in' do
    scenario 'logout form present if logged in' do
      visit('/')
      register
      expect(page).to have_button('Log out')
    end

    scenario 'login register form not present' do
      register
      expect(page).not_to have_button('Login')
      expect(page).not_to have_button('Register')
    end
  end

  scenario 'logout display flash message' do
    register
    logout
    expect(page).to have_content("You have logged out!")
  end
end
