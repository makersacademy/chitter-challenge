feature 'a user signing up' do
  scenario 'a new user is added to the db' do
    visit('/register')
    
    fill_in(:first_name, with: 'Bob')
    fill_in(:last_name, with: 'Michael')
    fill_in(:username, with: 'itsbob')
    fill_in(:email, with: 'bob@bob.com')
    fill_in(:password, with: 'password')
    click_button('Sign up')
  
    expect(page).to have_content('Signed in as: Bob')
    expect(page).not_to have_content('Register')
  end
end