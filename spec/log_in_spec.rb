feature 'user log in' do

  let!(:user) do
    User.create(name: 'Chaos Theory',
                user_name: 'Wunderkind',
                email: 'wunderkind@shaper.com',
                password: 'netrunner3')
  end

  scenario 'log in using the correct details' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome to chitter #{user.name}"
  end

  def log_in(*args)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
