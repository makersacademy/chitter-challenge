feature 'User sign in' do

  scenario "user should be able to log out" do
      visit '/sign_up'
      fill_in :email, with: "john.franco@franco.com"
      fill_in :name, with: "John Franco"
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      click_button "Sign out"
      expect(page).to have_content('goodbye!')
    end

  scenario "user should be able to log in" do
      visit '/sign_up'
      fill_in :email, with: "john.franco@franco.com"
      fill_in :name, with: "John Franco"
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      click_button "Sign out"
      visit '/sessions_new'
      fill_in :user_name, with: "John"
      fill_in :password, with: "John"
      click_button "submit"
      expect(page).to have_content('Welcome, John')
    end
end
