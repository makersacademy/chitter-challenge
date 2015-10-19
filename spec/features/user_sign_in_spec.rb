feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content "Welcome #{user.email}"
  end

  def sign_in(user)
    visit'/sessions/new'
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

  feature 'Users signs out' do

    scenario 'while being signed in' do
      user = create(:user)
      sign_in(user)
      click_button 'Sign out'
      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content("Welcome #{user.email}")
    end

  end

end
