feature "User can sign in" do
  scenario "when not signed in" do
    sign_up
    visit '/sessions/new'
    fill_in :username, with: "jimbo"
    fill_in :password, with: "llama123"
    click_button :Submit
    expect(page).to have_content "Welcome back, jimbo"
  end
end
