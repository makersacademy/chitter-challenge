feature "Signing up for Chitter" do
  scenario "User can create a Chitter account" do
    expect{ sign_up }.to change{ User.count }.by(1)
  end
end
