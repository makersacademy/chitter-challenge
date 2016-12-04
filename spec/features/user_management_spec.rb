feature "User sign up" do
  scenario "I can sign up as a new user" do
    visit "/users/new"
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq("kenji@gmail.com")
    expect(page).to have_content("Welcome, kenji@gmail.com")
  end
end
