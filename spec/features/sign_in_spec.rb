feature 'sign in an existing user' do
  scenario 'successfully sign in' do
    user_create
    sign_in
    expect(page).to have_content('Welcome, Bob McBob!')
  end

  scenario 'returns a flash message if user doesn\'t exist' do
    user_create
    visit '/'
    fill_in :email, with: 'bob@bob.com'
    fill_in :password, with: 'wrong_password'
    click_button 'Sign in'
    expect(page).to have_content('The email/password combination is incorrect')
  end
end
