feature "Sign-in" do
  scenario "a registered user can sign-in" do
    User.create(name: 'Robert',
                email: 'asdf@asdf.com',
                callsign: 'Rob-S',
                password: 'password',
                password_confirmation: 'password')
    visit '/session/new'
    fill_in :email, with: 'asdf@asdf.com'
    fill_in :password, with: 'password'
    click_button "Log In"
    expect(page).to have_content "Welcome Robert"
  end

  scenario "incorrect sign-in information will result in an error"do
    User.create(name: 'Robert',
                email: 'asdf@asdf.com',
                callsign: 'Rob-S',
                password: 'password',
                password_confirmation: 'password')
    visit 'session/new'
    fill_in :email, with: 'abc@asdf.com'
    fill_in :password, with: 'password'
    click_button "Log In"
    expect(page).to have_content "Log In invalid - plese try again"
  end

end
