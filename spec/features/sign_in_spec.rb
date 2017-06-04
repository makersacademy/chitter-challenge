xfeature "Signing in" do
  background do
    User.make(email: 'user@example.com',
              password: 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/sessions/new'
    within("#session") do
      fill_in(:email,    with: email)
      fill_in(:password, with: password)
    end
    click_button('Sign in')
    expect(page).to have_content('Success')
  end

  given(:other_user) { User.make(email: 'other@example.com',
                                password: 'rous') }

  scenario "Signing in as another user" do
    visit '/sessions/new'
    within("#session") do
      fill_in(:email,    with: email)
      fill_in(:password, with: password)
    end
    click_button('Sign in')
    expect(page).to have_content('Invalid email or password')
  end
end
