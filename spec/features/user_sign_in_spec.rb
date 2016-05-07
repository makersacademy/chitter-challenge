feature 'User sign in' do

  let(:user) do
    User.create(username: 'user1',
                email: 'hi@email.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'User can sign in to Chitter' do
    sign_in(user.username, user.password)
    expect(page).to have_content "Hey #{user.username}!"
  end

end
