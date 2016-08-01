feature 'sign out' do
  let!(:user) do
    User.create(email: 'example@example.com',
                name: 'example',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end
  scenario 'user can sign out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('signed out!')
    expect(page).not_to have_content('Welcome, example@example.com')
  end
end
