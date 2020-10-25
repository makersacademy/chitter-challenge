feature 'user can sign up for chitter with name, username, password and email' do
  scenario 'user creates an account and redirected to a page saying welcome' do
    visit('/signup')
    fill_in 'email', with: 'jackiechaplin929@gmail.com'
    fill_in 'username', with: 'j-dog101'
    fill_in 'name', with: 'Jackie Chaplin'
    fill_in 'password', with: 'chitter4L'
    click_on "Let's Go!"
    expect(page).to have_content('Welcome to Chitter, Jackie')
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

feature 'if username/email are already in use user redirected to failed sign up page' do
  scenario 'user tries to input a username already in use' do
    visit('/signup')
    fill_in 'username', with: 'j-dog101'
    fill_in 'name', with: 'Jackie Chaplin'
    fill_in 'password', with: 'chitter4L'
    click_on "Let's Go!"
    visit('/signup')
    fill_in 'username', with: 'j-dog101'
    fill_in 'name', with: 'Jackie Elsyd'
    fill_in 'password', with: 'iheartdogs'
    click_on "Let's Go!"
    expect(page).to have_content('Username or email currently in use, please try again:')
  end
end