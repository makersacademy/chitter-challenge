feature 'sign up' do
  scenario "user hasn't signed up or logged in" do
    visit("/peeps")
    expect(page).not_to have_content("Make a peep!")
    expect(page).to have_content("Sign up!")
  end
  scenario 'user signs up' do
    sign_up
    expect(page).to have_content("Make a peep!")
    expect(page).not_to have_content("Sign up")
  end
end

feature 'log in' do
  scenario "user hasn't signed up or logged in" do
    visit("/peeps")
    expect(page).to have_content("Log in")
  end
  scenario 'user signs in then logs out' do
    sign_up
    click_on 'Log out'
    log_in
    expect(page).to have_content("Make a peep!")
    expect(page).not_to have_content("Log in")
  end
end

feature 'log out' do
  scenario 'user logs out' do
    sign_up
    click_on 'Log out'
    expect(page).not_to have_content("Make a peep!")
    expect(page).to have_content("Log in")
  end
end
