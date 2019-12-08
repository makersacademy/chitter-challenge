feature "Authentication" do
  scenario "A maker can sign in" do
    sign_up
    sign_in

    expect(page).to have_content 'Welcome Angea89'
  end

  scenario 'A maker sees an error if they get their email wrong' do
    sign_up

    visit '/sessions/new'
    fill_in "email", with: "wrong_email@gmail.com"
    fill_in "password", with: "mypassword"
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Angea89'
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'A maker sees an error if they get their password wrong' do
    sign_up

    visit '/sessions/new'
    fill_in "email", with: "andrea@gmail.com"
    fill_in "password", with: "wrong_password"
    click_button 'Sign in'

    expect(page).not_to have_content 'Welcome Angea89'
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'A maker can sign out' do
    sign_up
    sign_in
    click_button 'Sign out'
  
    expect(page).not_to have_content 'Welcome, andrea@gmail.com'
    expect(page).to have_content 'You have signed out'
  end
end
