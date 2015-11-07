require './app/models/user.rb'

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
    visit ('/')
    fill_in('username', with: 'gwpmad')
    fill_in('email', with: 'george@test.com')
    fill_in('password', with: '12345')
    fill_in('name', with: 'George')
    click_button('Sign up')
    expect(page).to have_content('That email or username is already in use')
    expect(User.count).to eq 1
  end
end
