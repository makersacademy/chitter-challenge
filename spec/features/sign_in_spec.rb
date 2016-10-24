feature 'Sign in' do

  let!(:user) do
    User.create(user_name: 'kyaw', email: 'kyaw@gmail.com', password: '1234', password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    # sign_in(email: user.email, password: user.password)
    # expect(page).to have_content("Welcome, #{user.user_name}")
    sign_in(email: 'kyaw', password: '1234')
    expect(page).to have_content("Welcome, kyaw")
  end

end
