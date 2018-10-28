feature 'logs you out' do
  scenario 'user wants to end session' do
    sign_up_user
    click_button("home")
    click_button("Log Out")
    expect(page).to have_content("You have been logged out.")
  end
end
