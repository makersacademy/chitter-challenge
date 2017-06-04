feature "Signing up for Chitter" do
  scenario "User can create a Chitter account" do
    expect{ sign_up }.to change{ User.count }.by(1)
  end

  scenario "User signs up and sees their username in the welcome message" do
    sign_up
    expect(page).to have_content("Welcome to Chitter, Kynosaur!")
  end
end
