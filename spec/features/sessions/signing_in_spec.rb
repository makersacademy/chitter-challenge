feature "signin" do
  scenario "user visits homepage and tries to sign in" do
    log_in
    expect(current_path).to eq ('/')
    expect(page).to have_content('Hi, kiriarf')
  end

  scenario "user enters incorrect credentials" do
    visit('/')
    click_button('Log In')
    fill_in 'email', with: "wrong@email.com"
    fill_in 'password', with: "12345"
    click_button('Log In')
    expect(current_path).to eq ('/login')
    expect(page).to have_content('Incorrect credentials, please try again')
  end
end