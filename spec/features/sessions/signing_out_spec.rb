feature "signout" do
  scenario "cant see the button if not logged in" do
    visit('/')
    expect(page).not_to have_button('Log Out')
  end

  scenario "can log out when logged in" do
    log_in
    expect(page).to have_content('Hi, kiriarf')
    click_button('Log Out')
    expect(current_path).to eq ('/')
    expect(page).not_to have_content('Hi, kiriarf')
  end
end
