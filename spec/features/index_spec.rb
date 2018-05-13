feature 'Feed' do
  let(:user_details) {[
    { :email => 'bob@testing.com', :user_name => 'bob', :password => 'password' },
    { :email => 'fred@testing.com', :user_name => 'fred', :password => 'password' }
  ]}

  before do
    add_test_users_directly(user_details)
    visit '/'
  end

  scenario 'Page loads' do
    expect(page).to have_content 'Chitter'
  end

  scenario 'User can go to sign-up' do
    click_link 'sign_up_link'
    expect(page).to have_content 'Sign-up to Chitter'
  end

  scenario 'User can go to log-in' do
    click_link 'login_link'
    expect(page).to have_content 'Login to Chitter'
  end

  scenario 'User can logout' do
    full_log_in_journey(user_details[0][:user_name], user_details[0][:password])
    click_link 'Logout'
    expect(page).to have_content 'Logged out. See you again soon.'
  end
end
