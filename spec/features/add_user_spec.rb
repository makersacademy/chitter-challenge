  feature 'Add users' do
    let(:user_email) { 'bob@testing.com' }

    scenario 'Page loads and form visible' do
      visit '/user/new'
      expect(page).to have_content 'Sign-up to Chitter'
      expect(page).to have_field 'email'
      expect(page).to have_button 'Create account'
    end
    scenario 'Can sign-up' do
      visit '/user/new'
      fill_in 'email', with: user_email
      click_button 'Create account'
      expect(page).to have_content "Welcome #{user_email}"
    end
  end
