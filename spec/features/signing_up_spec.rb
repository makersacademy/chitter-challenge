feature 'user can sign up for chitter with name, username, password and email' do
  scenario 'user creates an account and redirected to a page saying welcome' do
    visit('/')
    fill_in 'email', with: 'jackiechaplin929@gmail.com'
    fill_in 'username', with: 'j-dog101'
    fill_in 'name', with: 'Jackie Chaplin'
    fill_in 'password', with: 'chitter4L'
    expect(page).to have_content('Welcome to Chitter Jackie!')
  end
end

# user creates account then clicks button 'go to chitter feed'