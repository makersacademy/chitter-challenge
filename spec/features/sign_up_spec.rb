feature 'Features - Sign Up' do

  before do
    visit('/')
    click_button 'Sign up'
  end
  scenario 'user signs up successfully' do
    fill_in :username, with: 'test'
    fill_in :name, with: 'rspec'
    fill_in :email, with: 'test@email.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).to have_content('Sign up successfully')
    expect(page).not_to have_content('Welcome back')
  end

  scenario 'user does not provide an email address' do
    fill_in :username, with: 'test'
    fill_in :name, with: 'rspec'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).not_to have_content('Welcome back')
    expect(page).to have_content('Ooops something is missing')
  end

  scenario 'user does not provide a username' do
    fill_in :name, with: 'rspec'
    fill_in :email, with: 'test@email.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).not_to have_content('Welcome back')
    expect(page).to have_content('Ooops something is missing')
  end

  scenario 'user does not provide a password' do
    fill_in :name, with: 'rspec'
    fill_in :username, with: 'test'
    fill_in :email, with: 'test@email.com'
    click_button 'Submit'
    expect(page).not_to have_content('Welcome back')
    expect(page).to have_content('Ooops something is missing')
  end

  scenario 'user does not provide a name' do
    fill_in :username, with: 'test'
    fill_in :email, with: 'test@email.com'
    fill_in :password, with: 'password123'
    click_button 'Submit'
    expect(page).not_to have_content('Welcome back')
    expect(page).to have_content('Ooops something is missing')
  end
end
