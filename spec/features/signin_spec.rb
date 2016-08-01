feature 'sign in' do
  let!(:user) do
    User.create(email: 'example@example.com',
                name: 'example',
                user_name: 'example',
                password: 'password',
                password_confirmation: 'password' )
  end
  scenario 'user can sign in correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{user.email}")
  end

  scenario "user can't sign in with incorrect email or password" do
    sign_in(email: user.email, password: 'wrong')
    expect(page).to have_content("The email or password is incorrect")
  end
end
