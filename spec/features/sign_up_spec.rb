feature "sign up" do
  context "from the sign up page" do 
    xscenario "lets new users sign up" do
      visit '/'
      fill_in 'username', with: 'Godzilla'
      fill_in 'email', with: 'godzilla@email.com'
      fill_in 'password', with: '1234'
      click_button 'Sign Up'

      expect(page).to have_content "Welcome to Chitter Chatter"
      expect(current_path).to eq '/users/sign_up'
    end

    scenario "Greets the User" do
      visit '/'
      fill_in 'username', with: 'Godzilla'
      fill_in 'email', with: 'godzilla@email.com'
      fill_in 'password', with: '1234'
      click_button 'Sign Up'

      expect(page).to have_content "Welcome Godzilla!"
      expect(current_path).to eq '/users/sign_up'
    end
  end
end