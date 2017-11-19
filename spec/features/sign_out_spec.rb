feature 'Sign out' do
  scenario 'I can sign out as a user' do
    User.create(
      email: 'elvis@gmail.com',
      password: 'Blue_Hawaii',
      password_confirmation: 'Blue_Hawaii'
    )
    sign_in
    click_button('Sign out!')
    expect(page).to have_content('Sayonara!')
    expect(page).not_to have_content('Welcome elvis@gmail.com!')
  end
end
