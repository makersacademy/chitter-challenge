feature "Adding and viewing peeps" do
  scenario 'a user can add a peep to the board if he has an account' do
    visit('/')

    click_button 'Log In'

    fill_in "user", with: "jsmith"
    fill_in "pass", with: "password"

    click_button 'Login'
    fill_in "peep", with: "It's sunny outside"
    click_button "Post"

    time = Time.now.strftime("%Y-%m-%d %H:%M")

    expect(page).to have_content "It's sunny outside"
    expect(page).to have_content(time)
  end
end