feature "User signs up" do
  scenario "I am able to sign up for Chitter" do
    sign_up
    expect(page).to have_content("Welcome, John!")
    expect(User.first.username).to eq("John")
  end
end
