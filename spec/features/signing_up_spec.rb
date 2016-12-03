feature "Signing up to chitter:" do
  scenario "user goes to signup page and makes an account" do

    visit '/users/new'
    def sign_up
      fill_in("email", with:"hello@gmail.com")
      fill_in("password", with:"averystrongpassword")
      fill_in("name", with: "John Johnson")
      fill_in("username", with: "johnnyboi")
      click_button("Submit")
    end

    expect{ sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content("Welcome to chitter johnnyboi")
  end
end
