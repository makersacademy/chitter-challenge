feature "When I sign up" do
  scenario "my username and password are persisted" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq "ladymacbeth@dunsinane.com"
    expect(User.first.username).to eq "LadyMacker123"
  end
  scenario "I am signed in" do
    sign_up
    expect(page).to have_content("Welcome, LadyMacker123!")
  end
end
