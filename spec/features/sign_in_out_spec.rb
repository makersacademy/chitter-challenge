feature 'Features - Sign in' do

  before do
    User.create(username: 'test', name: 'test', password: '1234',
      email: 'test@email.com')
  end

  scenario 'user wants to sign in' do
    visit ('/login')
    fill_in :username, with: 'test'
    fill_in :password, with: '1234'
    click_button 'Submit'
    expect(page).to have_content('welcome back!')
  end

  scenario 'user does not exists' do
    visit ('/login')
    fill_in :username, with: 'rspec'
    fill_in :password, with: '1234'
    click_button 'Submit'
    expect(page).to have_content('Wrong username/password')
    expect(page).not_to have_content('Welcome back')
  end

  scenario 'user used a wrong password' do
    visit ('/login')
    fill_in :username, with: 'test'
    fill_in :password, with: '123'
    click_button 'Submit'
    expect(page).to have_content('Wrong username/password')
    expect(page).not_to have_content('Welcome back')
  end
end
