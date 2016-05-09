feature "User sign out" do
  scenario "while being signed in" do
    user = create(:user)
    sign_in(user)
    click_button("Sign Out")
    expect(page.status_code).to be 200
    expect(page).to have_content "Goodbye"
    expect(page).not_to have_content "Welcome adilw3nomad"
  end
end
