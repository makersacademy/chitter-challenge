feature 'Sign in' do

  scenario 'The user can sign in with the correct credentials' do
    user = User.create(email: 'maybe@gmail.com', username: 'test', password: 'password', password_confirmation: 'password')
    visit '/sessions/sign_in'
    fill_in 'username', with: 'test'
    fill_in 'password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content("Hey #{user.username}")
  end

end
