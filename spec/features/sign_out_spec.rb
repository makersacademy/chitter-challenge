feature 'users can sign out' do
    before(:each) do
      User.create(email: 'yan@example.com',
                  name: 'Yan',
                  username: 'yanny',
                  password: 'password',
                  password_confirmation: 'password')
    end

    scenario "while signing in" do
      sign_in(email: 'yan@example.com', password: 'password')
      click_button "Sign out"
      expect(page).not_to have_content "Welcome, yan@example.com"
      expect(page).to have_content ("goodbye!")
    end
    end
