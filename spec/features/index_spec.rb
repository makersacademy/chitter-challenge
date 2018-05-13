feature 'Feed' do
  let(:user_details) {[
    { 'email' => 'bob@testing.com', 'user_name' => 'bob' },
    { 'email' => 'fred@testing.com', 'user_name' => 'fred' }
  ]}

  before do
    add_test_users(user_details)
    visit '/'
  end

  scenario 'Page loads' do
    expect(page).to have_content 'Chitter'
  end

  scenario 'User can login' do
    log_in_form(User.all[0].email)
    expect(page).to have_content "Welcome back #{User.all[0].user_name}"
  end

  scenario 'User can go to sign-up' do
    click_link 'sign_up_link'
    expect(page).to have_content 'Sign-up to Chitter'
  end
end
