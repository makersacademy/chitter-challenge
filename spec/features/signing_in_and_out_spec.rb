feature 'User sign in' do

  scenario 'with correct credentials' do
    user = create :user
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'error with incorrect password' do
    user = build(:user, password: 'wrong')
    sign_in(user)
    expect(page).to have_content("The username or password is incorrect")
  end

end

feature 'User signs out' do

  scenario 'while being signed in' do
    user = create :user
    sign_in(user)
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
  end

end
