feature 'Log in' do

  scenario 'I see a log in page with fields and a log in button' do
    visit('/log_in')

    expect(page).not_to have_content("Invalid credentials")
    expect(page).to have_field("username")
    expect(page).to have_field("password")
    expect(page).to have_button("Log in")
  end

  scenario 'I see an error for invalid credentials' do
    sign_up(username: "a username", password: "correct password")
    visit('/log_in')

    fill_in "username", with: "a username"
    fill_in "password", with: "wrong password"
    click_button 'Log in'

    expect(page).to have_content("Invalid credentials")
    expect(page).to have_field("username")
    expect(page).to have_field("password")
    expect(page).to have_button("Log in")
  end

end
