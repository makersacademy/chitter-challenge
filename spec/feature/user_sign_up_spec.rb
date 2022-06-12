feature "user registration" do
  scenario "new user signs up" do
    visit '/chitter/user/new'
    user_sign_up
    expect(page).not_to have_content "You must sign in to peep"
    expect(page).to have_button "Peep!"
  end
end

