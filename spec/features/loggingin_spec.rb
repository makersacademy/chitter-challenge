feature "Login Page" do
  context "when logging in:" do
    before do
      visit('/users/log-in')
    end
    scenario "there is an email field" do
      find_field('email')
    end
    scenario "there is a username field" do
      find_field('username')
    end
    scenario "there is a password field" do
      find_field('password')
    end
  end
end