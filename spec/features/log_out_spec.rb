feature "Signing in" do
  scenario "returns you to home page with message 'Successfully logged out'" do
    create_user_and_log_in
    click_button "Log out"

    expect(current_path).to eq '/'
    expect(page).to have_content "Successfully logged out"
  end
end
