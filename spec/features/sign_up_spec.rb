feature "Signing up for Chitter" do
  scenario "User can create a Chitter account" do
    expect{ sign_up }.to change{ User.count }.by(1)
  end

  scenario "User signs up and sees their username in the welcome message" do
    sign_up
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end

  scenario "User leaves a field empty upon signing up and account is not created" do
    visit "sign_up"
    fill_in("username", with: "Kynosaur")
    fill_in("password", with: "amazing_password")
    fill_in("email", with: "kynosnore@gmail.com")
    expect{ click_button("Submit") }.to change{ User.count }.by(0)
  end
end
