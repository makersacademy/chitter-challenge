feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    user_create_dave
    # Then sign in as them
    click_on 'Log in'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(current_path).to eq '/'
    expect(page).to have_content '@'
  end
end
