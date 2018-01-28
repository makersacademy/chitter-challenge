feature 'Sign-in feature --' do

  let!(:user) do
    User.create(username:'Batman',
                email:'cleo@email.com',
                password:'password1')
  end

  scenario 'User be able to sign-in after registration' do
    sign_in
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
