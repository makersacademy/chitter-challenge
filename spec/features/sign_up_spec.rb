feature "Signing up" do
  scenario "Users can sign up with their email, name, username and password" do
    visit '/'
    click_button "Sign up"
    fill_in :full_name, with: "Chandler Bing"
    fill_in :username, with: "Bingaling"
    fill_in :email, with: "funny_man@haha.com"
    fill_in :password, with: "IloveMonica"
    click_button "Sign up"
    expect(page).to have_content("Welcome to Chitter, Chandler")
  end
end
