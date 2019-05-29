feature "Create a user" do
  scenario "user can sign up to Chitter" do
    visit '/'
    click_button "Create an account"

    fill_in "name",     with: "John Smith"
    fill_in "username", with: "jsmith"
    fill_in "email",    with: "john@smith.com"
    fill_in "password", with: "password"

    click_button 'Submit'

    expect(page).to have_content 'Welcome jsmith'

  end
end
