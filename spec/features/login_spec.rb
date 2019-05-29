feature "Log In" do
  before(:each) do
    User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
    visit '/'
    click_button 'Log In'
    expect(page).to have_content "Log In"
  end

  scenario 'a user can login with correct details' do
    fill_in "user",     with: "jsmith"
    fill_in "password", with: "password"
    click_button "Log In"
    expect(page).to have_content "Welcome jsmith"
  end

  scenario 'a user sees an error message if incorrect username entered' do
    fill_in "user",     with: "wrong username"
    fill_in "password", with: "password"
    click_button "Log In"
    expect(page).not_to have_content "Welcome jsmith"
    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error message if incorrect password entered' do
    fill_in "user",     with: "jsmith"
    fill_in "password", with: "wrong password"
    click_button "Log In"
    expect(page).not_to have_content "Welcome jsmith"
    expect(page).to have_content 'Please check your email or password'
  end
end