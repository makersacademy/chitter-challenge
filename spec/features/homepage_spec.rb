feature 'You can see the homepage with chitter on it' do
  scenario do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end

feature 'You can sign in and see your newsfeed' do
    scenario do
      register
      sign_in
      expect(page).to have_content "Welcome user1"
    end
end

feature 'You will be told if you get the username incorrect' do
    scenario do
      register
      visit '/'
      fill_in 'username', with: 'user'
      fill_in 'password', with: 'password123'
      click_button 'Sign in'
      expect(page).to have_content 'Invaild username or password given - try again'
    end
end

feature 'You will be told if you get the password incorrect' do
    scenario do
      register
      visit '/'
      fill_in 'username', with: 'user1'
      fill_in 'password', with: 'password'
      click_button 'Sign in'
      expect(page).to have_content 'Invaild username or password given - try again'
    end
end

feature 'You can click logout and will return to the sign in page' do
    scenario do
      register
      sign_in
      click_button 'Logout'
      expect(page).to have_content 'Sign in to Chitter'
    end
end
