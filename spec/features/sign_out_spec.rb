feature "User can sign out when he wants" do

  scenario "allows user to sign out from chitter at any time" do
    user = User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
    visit ('/session/new')
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign In'
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Welcome, #{user.username}"
    click_button 'Sign Out'
    expect(page).to have_current_path '/peeps'
    expect(page).to_not have_content "Welcome, #{user.username}"
  end

end
