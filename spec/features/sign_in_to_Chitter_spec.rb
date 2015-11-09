feature 'User sign in' do
  let!(:user) do
    User.create(name: 'Ezzy Elliott',
              username: 'ezzye',
              email: 'ezzy.elliott@gmail.com',
              password: '123456',
              password_confirmation: '123456')
    end
  scenario 'with correct credentials' do
    sign_in(username: 'ezzye',
            password: '123456')
    expect(page).to have_content "Welcome, #{user.name}"
  end

end