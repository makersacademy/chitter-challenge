feature 'User sign up' do
  scenario 'Adds new user to database when registering' do
    register_new_user
    expect(User.count).to eq(1)
  end
  scenario 'Welcomes new user when registered' do
    register_new_user
    expect(page).to have_content('Welcome to Chitter, James Borrell')
  end
end
