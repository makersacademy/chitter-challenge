require './app.rb'

feature 'index page' do
  scenario 'index page exists' do
    visit '/'
    expect(page).to have_content("Chitter")
  end
end

feature 'Log in' do
   scenario 'page exists' do
    visit '/'
    click_button('Log in')
    expect(current_path).to eq '/login'
  end

   scenario 'is possible' do
    visit '/'
    click_button('Log in')
    expect(current_path).to eq '/login'
    fill_in 'username', with: 'test_username'
    fill_in 'password', with: 'test_password'
    click_button('Submit')
  end
end

feature 'Sign Up' do
   scenario 'page exists' do
    visit '/'
    click_button('Sign up')
    expect(current_path).to eq '/signup'
    fill_in 'name', with: 'test'
    fill_in 'date of birth', with: '21/03/2006'
    fill_in 'email', with: 'test.email@test.com'
    fill_in 'username', with: 'test_username'
    fill_in 'password', with: 'test_password'
    click_button('Submit')
  end
end