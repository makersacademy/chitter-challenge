feature "Authentication" do
  scenario "A maker can sign in" do
    Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")

    visit '/sessions/new'
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "mypassword"
    click_button 'Sign in'

    expect(page).to have_content 'Welcome Angea89'
  end
end
