feature "Sign-up" do
  scenario "New user can register with all informetion correctly entered" do
    expect{ sign_up }.to change{ User.count }.by(1)
  end

  scenario "returns errors when the sign up form is invalid" do
    expect{ sign_up(name: nil) }.not_to change { User.count }
  end
end
