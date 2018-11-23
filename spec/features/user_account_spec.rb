feature "user accounts" do
  scenario "creating a Chitter account" do
    visit '/'
    click_button 'Sign up for Chitter'
    fill_in 'username', with: "1337NewUser"
    fill_in 'email', with: "blank@nosite.com"
    fill_in 'name', with: "Anna Nemous"
    fill_in 'password', with: "Guest1"
    click_button 'Create account'
    expect(page).to have_content "Signed in as: Anna Nemous [1337NewUser]"
  end
end
