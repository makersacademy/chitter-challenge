feature 'User logs in' do

  scenario 'with valid email and password' do
    valid_user = build :user

    log_in valid_user

    expect(page).to have_content "Welcome, #{valid_user.email}"
  end

  scenario 'with incorrect email and password' do

  end

  scenario 'with forgotten email or password' do

  end

  def log_in user
    visit '/sessions/new'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
  end
end
