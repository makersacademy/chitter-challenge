feature 'User signs out' do

   before(:each) do
    User.create(email: 'test@test.com',
                 password: 'test123',
                 password_confirmation: 'test123')
   end

    scenario 'while being signed in' do
      sign_in(email: 'test@test.com', password: 'test123')
      click_button 'Sign out'
      expect(page).to have_content('Goodbye!')
      expect(page).not_to have_content('Welcome, test@test.com')
    end
end
