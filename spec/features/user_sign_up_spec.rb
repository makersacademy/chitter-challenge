feature 'User can sign up' do
  before(:each) do
    user_sign_up
  end

  scenario 'a user instance is created' do
    user_count_before = User.count
    click_button('Sign up')
    user_count_after = User.count
    expect(user_count_after).to eq user_count_before + 1
  end

  scenario 'displays a welcome message after user signs up' do
    click_button('Sign up')
    expect(page).to have_content('Welcome, gwpmad')
  end

  scenario 'Email address is correctly added to database' do
    click_button('Sign up')
    user = User.first(username: 'gwpmad')
    expect(user.email).to eq 'george@test.com'
  end

  scenario 'Redirect to error page when using in-use email or username' do
    click_button('Sign up')
    click_button('Log out')
    visit('/')
    within('.sign-up') do
      fill_in('username', with: 'gwpmad')
      fill_in('email', with: 'george@test.com')
      fill_in('password', with: '12345')
      fill_in('name', with: 'George')
      click_button('Sign up')
    end
    expect(page).to have_content('That email or username is already in use')
    expect(User.count).to eq 1
  end
end

feature 'Logging in and out' do
  before(:each) do
    user_sign_up
    click_button('Sign up')
    click_button('Log out')
  end

  scenario 'User can sign in with an existing password' do
    within('.log-in') do
      fill_in('email', with: 'george@test.com')
      fill_in('password', with: '12345')
      click_button('Log in')
    end
    expect(page).not_to have_content('Please sign up or log in')
  end

  scenario 'User can log out' do
    within('.log-in') do
      fill_in('email', with: 'george@test.com')
      fill_in('password', with: '12345')
      click_button('Log in')
    end
    click_button('Log out')
    expect(page).to have_content 'If you don\'t have an account, please sign up'
  end

  scenario 'Error page when user logs in with wrong username or password' do
    within('.log-in') do
      fill_in('email', with: 'wrong@test.com')
      fill_in('password', with: '12345')
      click_button('Log in')
    end
    expect(page).to have_content 'Username or password incorrect'
  end
end
