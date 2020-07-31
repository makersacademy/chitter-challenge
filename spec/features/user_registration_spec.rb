feature 'registration' do 
  scenario 'there is an option to register a new account' do
    visit '/'
    click_button 'Sign Up'
    expect(current_path).to eq '/users/new'
  end
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testy mctestface')
    fill_in('username', with: 'test123')
    click_button 'Submit'

    expect(page).to have_content "Welcome, test123!"
  end
end