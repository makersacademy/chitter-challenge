feature 'sign up' do
  scenario 'pressing sign up on the homepage takes you to the sign up page' do
    visit('/')
    click_button('Sign Up')
    expect(page).to have_content('Enter your name:')
  end

  scenario 'adds a user to the database' do
    visit('/signup')
    fill_in 'name', with: 'john'
    fill_in 'email', with: 'john@gmail.com'
    fill_in 'password', with: '123'
    click_button('Sign Up')
    expect(page).to have_content('Log In')
  end
end