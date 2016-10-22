feature "Sign In" do
  scenario "Sign in is visible on homepage" do
    visit '/'
    expect(page).to have_button("Sign in")
  end
end

feature "Sign In to account" do
  scenario "Sign in redirects to page with all peeps" do
    sign_in
    expect(page).to include Peep.all
  end
end

feature "Sign Up" do
  scenario "Sign up button is visible on homepage" do
    visit '/'
    expect(page).to have_content("Sign Up")
  end
end

feature "Sign Up takes you to all peeps" do
  scenario "Sign up button redirects to page with peeps" do
    sign_up
    expect(page).to include Peep.all
  end
end

feature "Add Peep" do
  scenario "User can add peep on log in" do
    sign_up
    expect(page).to have_button("Add peep")
  end
end

feature "Add Peep" do
  scenario "User can add peep on log in" do
    add_peep
    expect(Peep.count).to eq 1
  end
end

feature "See added peeps" do
  scenario "User can see peeps" do
    add_peep
    expect(page).to have_content "hello world"
  end
end

feature "Log Out" do
  scenario "Log out button takes me back to sign in" do
    sign_up
    click_button "Log Out"
    expect(page).to have_button("Sign in")
  end
end

feature "Log Out" do
  scenario "Log out button takes me back to sign in" do
    sign_up
    click_button "Log Out"
    expect(:session).to eq nil
  end
end
