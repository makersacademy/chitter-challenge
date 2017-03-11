feature "Registers the user on the app" do
  scenario "allows user to input credentials and welcomes them" do
    login_and_submit()
    expect(page).to have_content("Welcome Harkon! You are now registered on Chitter.")
  end
end
