feature "User can sign out when he wants" do

  scenario "allows user to sign out from chitter at any time" do
    user = User.create(email: 'test@test.com', password: 'test123', password_confirmation: 'test123', name: 'Ex Name', username: 'ename')
    sign_in(email: user.email, password: user.password)
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content "Welcome, #{user.username}"
    click_button 'Sign Out'
    expect(page).to have_current_path '/peeps'
    expect(page).to_not have_content "Welcome, #{user.username}"
  end

end
