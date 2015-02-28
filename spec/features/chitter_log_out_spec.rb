feature "User log out" do

  scenario "a logged in user can completely log out" do
    sign_in
    click_button "log out"
    expect(page).to have_content "You are signed out"
  end

  scenario "once signed out you must sign in again" do
    sign_in
    click_button "log out"
    visit '/peeps'
    expect(page).to have_content "Please sign in"
  end

end