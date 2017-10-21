feature "When I sign in" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  # scenario "a session is created" do
  #   sign_in
  #   expect(current_user).to be_truthy
  # end

  scenario "the homepage shows my username" do
    sign_in
    expect(page).not_to have_content("Welcome, Stranger!")
    expect(page).to have_content("Welcome, LadyMacker123!")
  end
end
