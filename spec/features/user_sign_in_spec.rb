feature 'User: Sign in ' do

  let!(:user) do
    User.create(email: 'user@user.com',
                password: 'pass',
                password_confirmation: 'pass',
                username: '@user')
  end

  scenario 'can sign into a user account' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content 'Hello, @user'
  end
end
