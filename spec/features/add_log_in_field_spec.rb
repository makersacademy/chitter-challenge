feature "add a log in feature" do
    scenario 'a user is met with a log in field' do
        visit('/')
        fill_in("login_email", with: "example.com")
        fill_in("login_password", with: "password")
        click_button "Log In"
    end
end