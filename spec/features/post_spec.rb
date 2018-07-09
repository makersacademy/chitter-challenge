require './app.rb'

feature 'post peep' do
  scenario 'user can fill out post peep form and see peep' do
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
    fill_in('message', with: 'My first peep')
    click_button('Post')

    expect(page).to have_content 'My first peep'
  end

  scenario 'peeps with time they were posted' do
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
    fill_in('message', with: 'My first peep')
    click_button('Post')
    expect(page).to have_content Time.now.strftime("%H:%M:%S")
  end
end
