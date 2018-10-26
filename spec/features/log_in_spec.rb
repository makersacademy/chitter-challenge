feature 'logs you in' do
  scenario 'username and password must match' do
    visit('/')
    click_button('Log In')
    fill_in('username', with: 'chloeverity123')
    fill_in('password', with: 'ilovemrcuddles')
    click_button('Log In')
    expect(page).to have_content("chloeverity123's peeps")
  end
end

feature "doesn't log you in" do
  scenario "password not authenticated" do
    visit('/')
    click_button('Log In')
    fill_in('username', with: 'chloeverity123')
    fill_in('password', with: 'wrongpassword')
    click_button('Log In')
    expect(page).to have_content("Password incorrect, try again!")
  end
end
