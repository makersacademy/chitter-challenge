feature 'User sign in' do

  let!(:user) do
    User.create(email: 'rob@gmail.com',
      password: 'mypassword',
      password_confirmation: 'mypassword',
      name: 'Robert', user_name: 'Rob')
  end

  def sign_in(email = user.email, password = user.password)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_on 'Sign in'
  end

  scenario 'user can sign in' do
    sign_in
    expect(page).to have_content "Welcome, #{user.user_name}"
  end

  it 'authenticates on valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate on incorrect details' do
    expect(User.authenticate(user.email, 'notmypassword')).to be_nil
  end
end
