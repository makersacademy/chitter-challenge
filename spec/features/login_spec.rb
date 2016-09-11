feature 'User log in' do
  let!(:user) do
    User.create(name: 'Tim',
                username: 'tintin',
                email: 'tintin@struppi.com',
                password: 'alpha',
                password_confirmation: 'alpha')
  end

  scenario 'User logs in succesfully given correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Hello #{user.username}!"
  end
end
