feature 'Add users' do
  let(:user_email) { 'bob@testing.com' }
  let(:user_user_name) { 'bob' }
  let(:user_password) { 'password' }

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
end
