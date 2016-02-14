
feature 'Sign In' do

  let(:user) do
    User.create(
                name: 'Sean',
                username: 'seanh',
                email: 's@s.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'a user can sign in with correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello, #{user.name}!"
    expect(page).not_to have_content "Hello, Stranger!"

  end

  scenario 'a user can\'t sign in with incorrect details' do
    sign_in(email: user.email, password: 'passwood')
    expect(page).to have_content "The email or password is incorrect"
  end

end
