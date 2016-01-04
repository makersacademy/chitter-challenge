feature 'User sign up' do
  scenario 'Adds new user to database when registering' do
    register_new_user
    expect(User.count).to eq(1)
  end
  scenario 'Welcomes new user when registered' do
    register_new_user
    expect(page).to have_content('Welcome to Chitter, James Borrell')
  end
  scenario 'Doesn\'t add new user to database if passwords do not match' do
    register_new_user(password_confirmation: 'brain')
    expect(User.count).to eq(0)
  end
  scenario 'Displays error message if passwords do not match' do
    register_new_user(password_confirmation: 'brain')
    expect(page).to have_content('Password and confirmation password do not match')
  end
  scenario 'Database cannot contain 2 users with same email address' do
    register_new_user
    click_button('Log Out')
    register_new_user
    expect(User.count).to eq(1)
  end
  scenario 'Displays error message if email address is already in use' do
    register_new_user
    click_button('Log Out')
    register_new_user
    expect(page).to have_content('Email address is already in use')
  end
end
