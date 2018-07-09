require './app.rb'

feature 'log in' do
  scenario 'user can log in to chitter' do
    visit '/'
    click_button("Register")
    fill_in('email', with: 'test@gmail.com')
    fill_in('username', with: 'test')
    fill_in('name', with: 'testname')
    fill_in('password', with: 'test123')
    click_button('Sign up')
    click_button('Sign in')
    fill_in('username', with: 'test')
    fill_in('password', with: 'test123')
    click_button('Log in')

    expect(page).to have_content 'Welcome test'
  end
end

feature 'log out' do
  scenario 'user can log out to chitter' do
    visit '/'
    click_button("Register")
    fill_in('email', with: 'test@gmail.com')
    fill_in('username', with: 'test')
    fill_in('name', with: 'testname')
    fill_in('password', with: 'test123')
    click_button('Sign up')
    click_button('Sign in')
    fill_in('username', with: 'test')
    fill_in('password', with: 'test123')
    click_button('Log in')
    click_button('Log out')

    expect(page).to have_content 'Logged out'
  end
end
