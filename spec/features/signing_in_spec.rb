feature 'Siging in' do

  let!(:user) do
    User.create(name: 'test',
                username: 'test',
                email: 'test@test.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_in(user.username, user.password)
    expect(page).to have_content("Welcome #{user.username}")
  end

  def sign_in(username, password)
    visit('sessions/new')
    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Sign in')
  end

end
