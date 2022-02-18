feature "signing up to chitter" do
  scenario "a new user signs up to chitter" do
    visit '/registrations/sign_up'
    fill_in :first_name, with: "Eddie"
    fill_in :last_name, with: "Arnold"
    fill_in :email, with: "123@me.com"
    fill_in :user_password, with: "12345"
    click_button "get chitting"
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content "Eddie"
  end
end