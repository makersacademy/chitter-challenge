feature 'Existing user log in' do

  let(:user){build :user}

  before do
    create :user
  end

  scenario 'can log in with username and password' do
    log_in(user)
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  scenario 'unable to log in if password incorrect' do
    user = build(:user, password: 'wrong')
    log_in(user)
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect"
  end

  def log_in(user)
    visit ('/')
    click_button 'Log in'
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_button 'Enter'
  end

end