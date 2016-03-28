feature "User can sign out" do

  scenario "while signed in" do
    register
    sign_in(email: "roxy@cat.com", password: "12345678")
    click_button("Sign out")
    expect(page).to have_content("Goodbye")
  end

end
