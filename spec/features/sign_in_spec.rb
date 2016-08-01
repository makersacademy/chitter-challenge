feature 'Sign in' do

  let!(:user) do
    User.create(name: "Jane Smith",
                email: 'user@example.com',
                username: "janesmith",
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'I can choose to sign up' do
    visit('/')
    expect(page).to(have_button("Sign in"))
  end

  scenario 'with correct credentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to(have_content("Hello, #{user.username}"))
  end

  scenario 'with incorrect credentials' do
    sign_in(username: user.username, password: "wrong")
    expect(page).to(have_content("The username or password is incorrect"))
  end

  scenario 'I can cancel sign in' do
    visit('/sessions/new')
    expect(page).to(have_button("Cancel"))
    click_button("Cancel")
    expect(current_path).to(eq('/cheeps'))
  end


end
