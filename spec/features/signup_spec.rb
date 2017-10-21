feature "When I sign up" do
  scenario "my username and password are persisted" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq "ladymacbeth@dunsinane.com"
    #expect(User.first.password).to eq "damn3dSp0t"
    expect(User.first.username).to eq "LadyMacker123"
  end
  scenario "I am signed in" do
    sign_up
    expect(page).to have_content("Welcome, LadyMacker123!")
    #the above is a proxy test - how can I check is a session has been created?
    #expect(ChitterApp.current_user.username).to eq "LadyMacker123"
  end
end
