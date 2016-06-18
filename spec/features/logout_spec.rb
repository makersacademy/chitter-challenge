feature "log out" do
  scenario "user can log out" do
    create_user
    log_in
    click_button 'log out'
    expect(page).to have_selector "input[value='log in']"
  end
end
