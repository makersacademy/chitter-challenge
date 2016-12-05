feature "User login" do
  let!(:user) { User.create(email: "keomony@gmail.com", password: "this is password")}

    xscenario "with correct credentials" do
      login(email: user.email, password: "this is password")
      expect(page).to have_content "Welcome, #{user.email}"
    end

end
