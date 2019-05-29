feature "Adding and viewing peeps" do
  scenario 'a user can add a peep to the board if he has an account' do
    User.create(name: 'John Smith', username: 'jsmith', email: 'john@smith.com', password: 'password')
    visit('/')

    click_button 'Log In'

    fill_in "username", with: "jsmith"
    fill_in "password", with: "password"

    click_button 'Log In'
    fill_in "peep", with: "It's sunny outside"
    click_button "Post"

    time = Time.now.strftime("%Y-%m-%d %H:%M")

    expect(page).to have_content "It's sunny outside"
    expect(page).to have_content(time)
    expect(page).to have_content(jsmith)
  end
end