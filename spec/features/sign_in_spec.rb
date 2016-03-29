
feature "User can sign in" do

  scenario "with correct email and password" do
    register
    sign_in(email: "roxy@cat.com", password: "12345678")
    expect(page).to have_content("Hi roxy_cat")
  end
end
