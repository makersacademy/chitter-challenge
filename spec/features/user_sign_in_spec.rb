feature 'User sign in' do

  let(:user) do
    User.create(name: 'Sity',
                username: 'sitypop',
                email: 'sity@ilovefalafel.com',
                password: 'secret',
                password_confirmation: 'secret')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Signed in as: #{user.username}"
  end

end
