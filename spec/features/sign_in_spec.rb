feature 'Sign in' do

  let!(:user) do
    User.create(name: "Jane Smith",
                email: 'user@example.com',
                username: "janesmith",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to(have_content("Hello, #{user.username}"))
  end

  scenario 'with incorrect credentials' do
    sign_in(username: user.username, password: "wrong")
    expect(page).to(have_content("The username or password is incorrect"))
  end

  def sign_in(username:, password: )
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button("Sign in")
  end


end
