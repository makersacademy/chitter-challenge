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
    expect(page).to have_content('Welcome Test. Let\'s peep!')
  end

end
