feature " allows a user to sign out" do
  scenario "if a user signs out, name no longer visible" do
    register
    log_in
    click_button('Log Out')
    expect(page).not_to have_content("Hello Rusty!")
  end
end

