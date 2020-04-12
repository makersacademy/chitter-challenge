feature 'authentication' do
  it 'a user can log in' do
    # Create a test user
    user_create_dave

    # Then sign in as them
    visit '/'
    click_on 'Log in'
    fill_in(:email, with: 'davedude@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(current_path).to eq '/'
    expect(page).to have_content '@dave'
  end
end
