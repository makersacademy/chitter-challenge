feature "Root page" do

  scenario "Should have button to navigate" do
    visit('/')
    expect(page).to have_selector("input[type=submit][value='View Peeps']")
    expect(page).to have_selector("input[type=submit][value='Sign Up']")
    expect(page).to have_selector("input[type=submit][value='Sign In']")
    expect(page).to have_content "Welcome to Ashwini's Chitter"
  end

end
