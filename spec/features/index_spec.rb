feature 'Index - feed page' do
  before do
    add_test_users
    visit '/'
  end

  scenario 'Page loads' do
    expect(page).to have_content 'Chitter'
  end

  scenario 'User can login' do
    fill_in 'login_email', with: User.all[0].email
    click_button 'Login'
    expect(page).to have_content "Welcome back #{User.all[0].email}"
  end

  scenario 'User can go to sign-up' do
    click_link 'sign_up_link'
    expect(page).to have_content 'Sign-up to Chitter'
  end
end
