feature 'Add users' do
  let(:user_email) { 'bob@testing.com' }
  let(:user_user_name) { 'bob' }
  let(:user_password) { 'password' }
  let(:user_details) { [{
    :email => user_email,
    :user_name => user_user_name,
    :password => user_password,
    }]}
  before do
    visit '/user/new'
  end

  scenario 'Page loads and form visible' do
    expect(page).to have_content 'Sign-up to Chitter'
    expect(page).to have_field 'email'
    expect(page).to have_field 'user_name'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Create account'
  end

  scenario 'Can sign-up' do
    fill_in 'email', with: user_email
    fill_in 'user_name', with: user_user_name
    fill_in 'password', with: user_password
    click_button 'Create account'
    expect(page).to have_content "Welcome #{user_user_name}"
  end

  scenario "Can't sign-up when email address already used" do
    add_test_users(user_details)
    fill_in 'email', with: user_email
    fill_in 'user_name', with: 'different_username'
    fill_in 'password', with: user_password
    click_button 'Create account'
    expect(page).to have_content "Email address (#{user_email}) already used."
  end

  scenario "Can't sign-up when user name already used" do
    add_test_users(user_details)
    fill_in 'email', with: 'different@testing.com'
    fill_in 'user_name', with: user_user_name
    fill_in 'password', with: user_password
    click_button 'Create account'
    expect(page).to have_content "User name (#{user_user_name}) already taken."
  end

end
