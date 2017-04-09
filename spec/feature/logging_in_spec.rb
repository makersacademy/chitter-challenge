feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com',
                password: 'password',
                password_confirmation: 'password',
                name: 'Test McTester',
                username: 'testalltheoutcomes')
  end

  scenario 'Signing in' do
    sign_in(email: 'test@test.com',   password: 'password')
    expect(page).to have_content "Welcome, test@test.com"
  end


end
