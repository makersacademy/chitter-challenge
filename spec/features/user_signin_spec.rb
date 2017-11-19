feature 'User sign in' do

  let!(:user) do
    User.create(email: 'thatdania@gmail.com',
                username: 'thatdania',
                password: 'potatoe',
                password_confirmation: 'potatoe')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Hey #{user.username}!"
  end

end
