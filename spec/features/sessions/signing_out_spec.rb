feature "signout" do
  scenario "cant see the button if not logged in" do
    visit('/')
    expect(page).not_to have_button('Log Out')
  end

  scenario "can log out when logged in" do
    visit('/')
    click_button('Log In')
    fill_in "email",	with: "kiriarf@chitter.com"
    fill_in "password",	with: "123"
    click_button('Log In')
    expect(page).to have_content('Hi, kiriarf')
    click_button('Log Out')
    expect(current_path).to eq ('/')
    expect(page).not_to have_content('Hi, kiriarf')
  end
end