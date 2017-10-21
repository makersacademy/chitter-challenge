feature "Signing-up to Chitter" do
  scenario "I can enter a username and password" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq "ladymacbeth@dunsinane.com"
    #expect(User.first.password).to eq "damn3dSp0t"
    expect(User.first.username).to eq "LadyMacker123"
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content("Welcome, LadyMacker123!")
  end
end
