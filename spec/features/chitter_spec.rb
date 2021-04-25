feature 'chitter main page' do
  scenario 'the main page should welcome the user' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'it allows user to sign in to view peeps' do
    visit '/'
    click_button 'Sign in'
    expect(current_path).to eq '/peeps'
  end

  scenario 'a user can sign up' do
    visit '/'
    click_button 'Sign up'
    expect(current_path).to eq '/users/new'
    fill_in('name', with: 'test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
  
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, test"
  end
end
