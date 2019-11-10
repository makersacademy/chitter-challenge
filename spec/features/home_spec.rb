feature 'Home page' do
  scenario 'greets new user' do
    visit('/')
    click_button('Register')
    fill_in('name', with: 'Tom')
    fill_in('email', with: 'chitter_test@outlook.com')
    fill_in('password', with: 'twatter8')
    click_button('Submit')
    expect(page).to have_content('Hi, Tom!')
  end

  scenario 'greets existing user' do
    Peeper.create(name: 'Tom', email: 'chitter_test@outlook.com', password: 'twatter8')
    visit('/')
    click_button('Log in')
    fill_in('name', with: 'Tom')
    fill_in('password', with: 'twatter8')
    click_button('Submit')
    expect(page).to have_content('Hi, Tom!')
  end

  scenario 'refuses wrong password entry' do
    Peeper.create(name: 'Tom', email: 'chitter_test@outlook.com', password: 'twatter8')
    visit('/')
    click_button('Log in')
    fill_in('name', with: 'Tom')
    fill_in('password', with: 'skdjdkjfhv')
    click_button('Submit')
    expect(page).to have_content('Please log in below.')
  end
end
