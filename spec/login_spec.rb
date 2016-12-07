feature "User login" do
  before do
    sign_up(email: "keomony@gmail.com", password: "this is password", password_confirmation: "this is password")
  end

    scenario "with correct credentials" do
      login(email: "keomony@gmail.com", password: "this is password")
      expect(page).to have_content "Welcome, keomony@gmail.com"
    end

end
