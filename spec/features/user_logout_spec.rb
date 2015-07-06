feature 'user can log out' do
  let (:user) do
    User.create(email: 'kate@email.com',
             password: '1234',
             username: 'kate',
             password_confirmation: '1234')
  end

  scenario 'when there is a user logged in' do
    register(user)
    sign_in(email: 'kate@email.com',
            password: '1234')
    click_on 'Log out'
    expect(page).not_to have_content "You're logged in as kate"
  end

end