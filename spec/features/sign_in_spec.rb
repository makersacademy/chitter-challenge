feature 'User signing in' do

  scenario 'an existing user can log in' do
  sign_in(username: 'xyz', password: 'pass')
   expect(page.status_code).to eq(200)
  end

  let!(:user) do
    User.create(username: 'userexample',
                password: 'secret',
                confirm_password: 'secret',
                name: 'sam',
                email: 'sam@example.com')
  end
  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
