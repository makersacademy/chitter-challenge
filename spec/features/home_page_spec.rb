require './app/models/user'

def go_to_home_page; visit '/'; end

def go_to_login; visit '/login'; end

def go_to_register; visit '/register'; end

def log_in;
  go_to_login
  fill_in :username, with: 'test'
  fill_in :password, with: 'password1'
  click_button('Submit')
end

def create_account
  go_to_register
  fill_in :name, with: 'bot botterson'
  fill_in :email, with: 'bot@bot.com'
  fill_in :username, with: 'test'
  fill_in :password, with: 'password1'
  click_button('Submit')
  log_in
end

feature 'home page when not logged in' do

  before do
    go_to_home_page
  end

  scenario 'redirects to login form' do
    expect(current_path).to eq '/login'
  end

end

feature 'home page login form' do

  before do
    go_to_login
  end

  scenario 'displays log in form' do
    expect(page).to have_content('Log In')
    expect(page).to have_content('username')
    expect(page).to have_content('password')
  end

  scenario 'displays link to register form' do
    expect(page).to have_link('register new account')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'does not display form for new posts' do
    expect(page).to_not have_content('Create New Post')
  end
end

feature 'home page register form' do

  before do
    go_to_register
  end

  scenario 'displays register form' do
    expect(page).to have_content('Register New Account')
    expect(page).to have_content('name')
    expect(page).to have_content('email')
    expect(page).to have_content('username')
    expect(page).to have_content('password')
  end

  scenario 'displays link to login form' do
    expect(page).to have_link('login to existing account')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'does not display form for new posts' do
    expect(page).to_not have_content('Create New Post')
  end

end

feature 'home page when logged in' do

  before do
    create_account
  end

  scenario 'has user table entry' do
    expect(User.first(username: 'test')).to_not eq(nil)
  end

  scenario 'can create account and log in' do
    expect(current_path).to eq('/')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'displays form for new posts' do
    expect(page).to have_content('Create New Post')
  end

end
