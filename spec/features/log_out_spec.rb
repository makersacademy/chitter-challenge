feature "User log out" do
  scenario "a current user can log out" do
    sign_up
    sign_in
    click_button "Log out"
    expect(page).to have_content "Thanks for using Chitter"
    expect(page).not_to have_content "Welcome Luke"
    expect(page.current_path).to eq "/"
  end
end
