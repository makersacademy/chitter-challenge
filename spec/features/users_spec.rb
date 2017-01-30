feature "FEATURE: Signing Out" do
    before (:each) { User.create(email: "test@test.com",
      password: "password", password_confirmation: "password",
      name: "Test Test", username: "test") }

    scenario "can sign out when signed in" do
      sign_in(username: 'test', password: 'password')
      click_button 'sign_out'
      expect(page).to have_content 'Goodbye!'
      expect(page).not_to have_content "Welcome, test"
    end
end
