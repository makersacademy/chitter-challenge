feature 'User Authentication' do
  context 'Sign Up' do
    scenario 'A user can sign up' do
      visit '/'
      click_on 'Sign Up'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'testpassword'
      fill_in :fullname, with: 'testy mctestface'
      fill_in :username, with: "test"
      click_button 'Submit'

      expect(page).to have_content 'Welcome, test@test.com'
    end
  end
end
