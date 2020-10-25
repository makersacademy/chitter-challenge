feature 'user can sign up for chitter with name, username, password and email' do
  scenario 'user creates an account and redirected to a page saying welcome' do
    visit('/signup')
    fill_in 'email', with: 'jackiechaplin929@gmail.com'
    fill_in 'username', with: 'j-dog101'
    fill_in 'name', with: 'Jackie Chaplin'
    fill_in 'password', with: 'chitter4L'
    visit('/welcome')
    expect(page).to have_content('Welcome to Chitter, Jackie!')
  end
end

# feature 'Button on welcome page redirects to chitter feed' do
#   scenario 'user clicks check out chitter feed and is on chitter feed' do
#     visit('/')
#     fill_in 'email', with: 'jackiechaplin929@gmail.com'
#     fill_in 'username', with: 'j-dog101'
#     fill_in 'name', with: 'Jackie Chaplin'
#     fill_in 'password', with: 'chitter4L'
#     visit('/welcome')
#     click_on('Check out the chitter feed')
#     expect(page).to be_empty
#   end
# end
# user creates account then clicks button 'go to chitter feed'