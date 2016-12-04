feature "Logging out" do
  scenario "A user can sign out" do
    sign_up
    correct_log_in
    click_button('log-out')
    expect(page).to have_content("Goodbye!")
    expect(page).not_to have_content("Welcome samuel@gmail.com!")
  end
end
