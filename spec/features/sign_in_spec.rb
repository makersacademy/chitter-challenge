feature "Signing in" do
  scenario "User can sign in" do
    sign_up
    visit '/'
    click_button "Sign in"
    fill_in :email, with: ("funny_man@haha.com")
    fill_in :password, with: ("IloveMonica")
    click_button "Sign in"
    expect(page).to have_content "Welcome to Chitter, Chandler"
  end
end
