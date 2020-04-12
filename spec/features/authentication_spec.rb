feature 'authentication' do
  it 'a user can log in if credentials are correct' do
    # Create a test user
    user_create_dave

    # Then log in as them
    visit '/'
    click_on 'Log in'
    fill_in(:email, with: 'davedude@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(current_path).to eq '/'
    expect(page).to have_content '@davedude'
  end

  it 'a user cannot log in if email is not registered' do
    # Create a test user
    user_create_dave

    # Attempt log in with incorrect email
    visit '/'
    click_on 'Log in'
    fill_in(:email, with: 'wrongemail@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log in')

    expect(current_path).to eq '/'
    expect(page).to_not have_content '@davedude'
    expect(page).to have_content 'Email or password incorrect'
  end
end
