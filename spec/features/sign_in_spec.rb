
feature 'User sign in' do

  let!(:user) do
    User.create(email: 'dog@example.com',
                password: 'miao',
                password_confirmation: 'miao')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario 'with wrong credentials' do
    sign_in(email: user.email, password: "dumbpassword")
    expect(page).to have_content "The email or password is incorrect"
  end


end
