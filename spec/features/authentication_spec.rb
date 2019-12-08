feature "Authentication" do
  scenario "A maker can sign in" do
    Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")

    sign_in

    expect(page).to have_content 'Welcome Angea89'
  end

  scenario 'A maker sees an error if they get their email wrong' do
    Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")

    visit '/sessions/new'
    fill_in "email", with: "wrong_email@gmail.com"
    fill_in "password", with: "mypassword"
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Angea89'
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'A maker sees an error if they get their password wrong' do
    Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")

    visit '/sessions/new'
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "wrong_password"
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Angea89'
    expect(page).to have_content "Incorrect email or password"
  end
end
