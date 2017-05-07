feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',)
  end

  scenario 'with correct details' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome"
  end

end
