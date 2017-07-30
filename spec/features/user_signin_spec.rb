feature 'User sign in' do
  let!(:user) do
    User.create(name: 'Anna',
                nickname: 'xx1xx',
                email: 'one@example.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_in(nickname: user.nickname,   password: user.password)
    expect(page).to have_content "CHITTER New user"
  end

  def sign_in(nickname:, password:)
    visit '/sessions/new'
    fill_in :nickname, with: nickname
    fill_in :password, with: password
    click_button 'Sign Up'
  end

end
