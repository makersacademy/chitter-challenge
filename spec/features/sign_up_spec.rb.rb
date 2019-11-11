feature 'sign up' do
    scenario 'a user can sign UP' do
     
      visit '/user/new'
      fill_in :email, with: 'test@example.com'
      fill_in :password, with: 'test'
      fill_in :name, with: 'test@example.com'
      fill_in :username, with: '@test'
      click_button('Sign in')
  
      expect(page).to have_content 'Welcome, @test'
    end
end