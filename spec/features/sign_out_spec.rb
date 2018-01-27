feature 'sign out' do

  before :each do
    user = create_test_user
  end

  scenario 'the user can end the session after signing in' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
