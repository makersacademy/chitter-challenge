feature 'User can sign out' do

  before(:each) do
    User.create(user_name: 'test_user',
                user_email: 'test_user@tests.test',
                password: 'testing123',
                password_confirmation: 'testing123')
  end

  scenario 'User signs out while being signed in' do
    sign_in
    click_button 'Sign out'
    expect(current_path).to eq '/messages'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome to Chitter, test_user')
  end

end
