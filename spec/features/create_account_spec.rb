feature "create account" do
  scenario "make an account" do
    visit('/')
    click_button 'Create Account'
    Capybara.match = :prefer_exact
    fill_in('email', with: "berkley_huntsworth@HMRberks.co.uk")
    page.find_by_id('password').fill_in(with: "password")
    fill_in('confirm_password', with: "password")
    fill_in('username', with: "the_Berkmeister")
    fill_in('screenname', with: "Berkly Huntsworth")
    click_button "Create Account"
    # expect(page).to have_content("@")
    expect(page).to have_content("Signed in as Berkly Huntsworth (@the_Berkmeister)")
  end

  scenario "returns error when passwords don't match" 

  scenario "returns error when email is bad"

  scenario "returns error when username is taken"

  scenario "returns error when email is taken"

end