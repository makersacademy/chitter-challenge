feature "sign up" do
  context "from the sign up page" do
    scenario "lets new users sign up" do
      visit '/users/sign_up'
      fill_in 'username', with: 'Godzilla'
      fill_in 'email', with: 'godzilla@email.com'
      fill_in 'password', with: '1234'
      click_button 'Sign Up'

      expect(current_path).to eq '/users/sign_up'
    end

    # Test above passes but the actual route is not working (??)

    scenario "Greets the User" do
      visit '/users/sign_up'
      fill_in 'username', with: 'Godzilla'
      fill_in 'email', with: 'godzilla@email.com'
      fill_in 'password', with: '1234'
      click_button 'Sign Up'

      expect(current_path).to eq '/users/sign_up'
      expect(page).to have_content "Welcome Godzilla!"
    end
  end
end
