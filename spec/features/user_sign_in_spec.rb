feature 'User sign in' do
  scenario 'an existing user can log in' do
    visit '/'
    click_link 'Sign In'
    expect(page.status_code).to eq(200)
  end

  let!(:user) do
    User.create(full_name: 'Joe Sweeny',
                username: 'joesweeny',
                email: 'joesweeny84@hotmail.com',
                password: 'buddy123',
                password_confirmation: 'buddy123')
  end

  scenario 'log in with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content "Welcome, @#{user.username}"
  end
end
