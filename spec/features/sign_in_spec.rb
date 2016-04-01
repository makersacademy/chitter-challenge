feature 'sign_in_spec: Signing in' do

  let(:user) do
    User.create(name: 'Test',
                username: 'Test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'user can sign in with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content('Test')
  end

  scenario 'user cannot sign with incorrect username' do
    sign_in(username: 'boo', password: user.password)
    expect(page).to have_content('The username or password is incorrect.')
  end

  scenario 'user cannot sign with incorrect password' do
    sign_in(username: user.username, password: 't')
    expect(page).to have_content('The username or password is incorrect.')
  end

end
