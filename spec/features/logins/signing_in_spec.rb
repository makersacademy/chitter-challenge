feature "signin" do
  scenario "user visits homepage and tries to sign in" do
    visit('/')
    click_button('Log In')
    fill_in "email",	with: "kiriarf@chitter.com"
    fill_in "password",	with: "123"
    click_button('Log In')
    expect(current_path).to eq ('/')
    expect(page).to have_content('hi, kiriarf')
  end

  scenario "user enters incorrect credentials" do
    visit('/')
    click_button('Log In')
    fill_in 'email', with: "wrong@email.com"
    fill_in 'password', with: "12345"
    expect(current_path).to eq ('/login')
    expect(page).to have_content('Incorrect credentials, please try again')
  end
end