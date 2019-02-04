feature do
  scenario 'signing up' do
    visit '/'
    fill_in 'displayname', with: 'Test Name'
    fill_in 'username', with: 'testname'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'secret'
    click_button 'Sign up'
    expect(page).to have_content 'User: Test Name'
  end

  scenario 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('secret')
    visit '/'
    fill_in 'displayname', with: 'Test Name'
    fill_in 'username', with: 'testname'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'secret'
    click_button 'Sign up'
  end
end
