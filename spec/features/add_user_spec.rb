feature 'Add users' do
  let(:user_email) { 'bob@testing.com' }

  before do
    visit '/user/new'
  end

  scenario 'Page loads and form visible' do
    expect(page).to have_content 'Sign-up to Chitter'
    expect(page).to have_field 'email'
    expect(page).to have_button 'Create account'
  end

  scenario 'Can sign-up' do
    fill_in 'email', with: user_email
    click_button 'Create account'
    expect(page).to have_content "Welcome"
  end
end
