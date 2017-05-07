feature 'User log in' do

  let!(:user) do
    User.create(name: 'example', username: 'UsernameExample',
                email: 'user@email.com', password: 'password',
                password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Hello! #{user.username}"
  end

end
