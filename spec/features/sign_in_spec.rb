feature 'Sign in' do
  scenario 'I can sign in as a user' do
    User.create(
      name: 'Elvis',
      email: 'elvis@gmail.com',
      username: 'King',
      password: 'Blue_Hawaii',
      password_confirmation: 'Blue_Hawaii'
    )
    sign_in
    expect(page).to have_content 'Welcome @King!'
  end
end
