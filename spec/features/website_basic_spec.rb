require './app/lib/user'

feature 'Website tests:' do

  scenario 'a user can see the website name' do
    visit('/')
    expect(page).to have_content("Chitter")
  end

  scenario 'a user can post a peep' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('I had some coffee')
  end

  scenario 'a user sees the posts in reverse chronological order' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    fill_in('peep', with: 'I had some cake')
    click_button('Post')
    fill_in('peep', with: 'I had some bread')
    click_button('Post')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('I had some bread')
  end

  scenario 'a user can see the time a peep was made 2' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    expect(current_path).to eq('/')
    page.find('.peep__time', :visible => true)
  end

  scenario 'a user can sign up to Chitter' do
    visit('/')
    expect(page).to have_button('sign up')
    click_button('sign up')
    expect(current_path).to eq('/users/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content('Welcome, test@test.com')
  end

  scenario 'a user can sign in' do
    User.create(email: 'test@test.com', password: 'password')
    visit('/sessions/new')
    fill_in(:email, with: 'test@test.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, test@test.com'
  end

  scenario 'a user sees an error if they try to log in with the wrong email' do
    User.create(email: 'hi@hello.com', password: 'password')
    visit('/')
    click_on('Login')
    expect(current_path).to eq('/sessions/new')
    fill_in(:email, with: 'h@hello.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(current_path).to eq('/sessions/new')
    expect(page).not_to have_content('Welcome, hi@hello.com')
    expect(page).to have_content('Incorrect email or password')
  end
  
  scenario 'a user sees an error if they try to login with an incorrect password' do
    User.create(email: 'hi@hello.com', password: 'password')
    visit('/')
    click_button('Login')
    expect(current_path).to eq('/sessions/new')
    fill_in(:email, with: 'hi@hello.com')
    fill_in(:password, with: 'passwor')
    click_button('Sign in')
    expect(current_path).to eq('/sessions/new')
    expect(page).not_to have_content('Welcome, hi@hello.com')
    expect(page).to have_content('Incorrect email or password')
  end

  scenario 'a user can sign out' do
    User.create(email: 'hi@hello.com', password: 'password')
    visit('/')
    click_button('Login')
    expect(current_path).to eq('/sessions/new')
    fill_in(:email, with: 'hi@hello.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome, hi@hello.com')
    click_button('Logout')
    expect(page).not_to have_content('Welcome, hi@hello.com')
    expect(page).to have_button('Login')
  end
end