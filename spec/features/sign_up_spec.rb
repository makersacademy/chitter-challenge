feature "Signing up" do
  scenario "Users can sign up with their email, name, username and password" do
    sign_up
    expect(page).to have_content("Welcome to Chitter, Chandler")
  end

  scenario "Once signed up, the user count increases by 1" do
    sign_up
    expect(User.count).to eq(1)
  end
end
