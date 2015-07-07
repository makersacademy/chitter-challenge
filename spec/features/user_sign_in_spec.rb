feature "User sign in" do

  scenario 'with correct credentials' do
    user = create_user
    visit '/users/login'
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Welcome, #{user.username}")
  end

  scenario 'fails with incorrect credentials' do
    user = create_user
    visit '/users/login'
    fill_in :username, with: user.username
    fill_in :password, with: "wrong"
    click_button 'Sign in'
    expect(page).to have_content('The Username or Email is incorrect')
  end
end