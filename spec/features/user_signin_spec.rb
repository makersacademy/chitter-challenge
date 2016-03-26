feature 'user_signin' do

  let(:user) do
    User.create(username: 'user1',
                email: 'user1@email.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'User signs in with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content("Welcome #{user.username}!")
  end

  scenario 'Cannot sign in with incorrect credentials' do
    sign_in(username: user.username, password: 'wrong')
    expect(current_path).to eq '/sessions'
    expect(page).to have_content('The username or password is incorrect')
  end
end
