feature 'registration' do 
  scenario 'there is an option to register a new account' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
  end
  scenario 'a user can sign up' do
    register_test
    expect(page).to have_content "Welcome, test123!"
  end
end
