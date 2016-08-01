feature "Sign up" do
  scenario "As a new user I want to sign up" do
    def sign_up(name: "Titus Iudean",
                username: "AppsDJ",
                email: "ty@appsdj.com",
                password: "pass")
      visit 'users/new'
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Sign Up"
    end

    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Hello ty@appsdj.com"
  end
end
