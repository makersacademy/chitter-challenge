feature 'registration' do 
  scenario 'there is an option to register a new account' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
  end
  scenario 'a user can sign up' do
    register_test
    expect(page).to have_content "Welcome, test123!"
    expect(page).not_to have_content 'An account already exists with this email.'
  end
  scenario 'registering an account with the same email causes an error' do 
    create_test_user
    register_test
    expect(page).to have_content 'An account already exists with this email.'
  end
end
