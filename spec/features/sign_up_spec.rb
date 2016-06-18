feature "FEATURE: Sign up" do
  scenario "create new user on sign up" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content("Welcome to Spitter, Solid Snake")
    expect(User.first.email).to eq('snake@mgs.com')
  end
end
