feature "User sign out" do

  scenario "whilst being logged in" do
    user = create_user
    sign_in(user)
    visit '/users/logout'
    expect(page).to have_content("Welcome")
    click_button 'Sign out'
    expect(page).not_to have_content("Welcome")
  end
end