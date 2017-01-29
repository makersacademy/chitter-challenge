feature "User can sign in" do
  scenario "when not signed in" do
    sign_in
    expect(page).to have_content "Welcome back, jimbo"
  end
end
