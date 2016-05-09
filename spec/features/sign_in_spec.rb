feature 'User sign in' do

  let(:user) do
    User.create(name: 'Aday Mesa',
                username: 'adaymesa',
                email: 'adaymesagc@gmail.com',
                password: 'yipiyey!',
                password_confirmation: 'yipiyey!')
  end

  scenario 'Correct details' do
    sign_in(username: user.username,   password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
