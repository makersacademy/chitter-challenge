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
  
  scenario 'a user can see the time a peep was made' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    expect(current_path).to eq('/')
    expect(first('.peep__time')).to have_text(/\d{2}:\d{2}:\d{2}/)

  end

  scenario 'a user can see the time a peep was made 2' do
    visit('/')
    fill_in('peep', with: 'I had some coffee')
    click_button('Post')
    expect(current_path).to eq('/')
    page.find('#peep-1', :visible => true)
  end

  scenario 'a user can sign up to Chitter' do
    visit('/')
    expect(page).to have_link('sign up', href: '/users/new')
    click_on('sign up')
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
end