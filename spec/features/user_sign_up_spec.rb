feature "User sign up" do
  scenario "users can sign up to chitter with their details" do
    register_user
    expect(page).to have_content("Thank you for registering to chitter")
  end
end
