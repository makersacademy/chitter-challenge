
feature 'User Log in' do
  scenario 'existing user can log in' do
      User.create(email: 'nandy@email.com', password:'example123')
      visit '/log_in'
      fill_in :email, with:'nandy@email.com'
      fill_in :password, with:'example123'
      click_button 'submit'
      expect(page).to have_content "Welcome, nandy@email.com"
  end
end
