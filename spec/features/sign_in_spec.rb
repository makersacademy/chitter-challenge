feature 'SIGN IN' do

  let(:user) do
    User.create(name: 'johnson',
                username: 'mr_johnson',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario '-> lets users sign in to an existing account' do
    sign_in_1(username: user.username, password: user.password)
    expect(page).to have_content("Welcome, #{user.username}")
  end



end
