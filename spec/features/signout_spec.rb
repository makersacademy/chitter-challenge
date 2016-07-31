feature 'sign out' do
  let!(:user) do
    User.create(email: 'example@example.com',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end
  scenario 'user can sign out' do
    sign_in(user.email, user.password)
    click_button 'Sign out'
    expect(page).to have_content('You have signed out!')
  end
end
