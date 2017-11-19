feature "User sign in" do
  scenario "existing user wants to sign in" do
    sign_up
    sign_in
    expect(page).to have_content('Logged in as Megadrive')
  end
end
