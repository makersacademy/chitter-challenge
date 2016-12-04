feature "Login" do
  before do
    user = User.create(email: "keomony@gmail.com", password: "this is password")
  end
  scenario "user fills in their email address and password" do
    visit "/"
    login
    expect(page.current_path).to eq "/login"
    expect(page).to have_content("Welcome, keomony@gmail.com")
  end
end
