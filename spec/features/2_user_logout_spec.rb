require "user"

feature 'Feature: Logout' do
  scenario 'a valid user can log out if logged in' do
    User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/user'
    fill_in :name, with: 'Elvis'
    fill_in :password, with: 'password'
    click_button('submit')
    click_link('Logout')
    expect(page).to have_content 'Logout successful'
  end

  scenario 'a valid user cannot post anything after logout' do
    User.create(name: "Elvis", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/user'
    fill_in :name, with: 'Elvis'
    fill_in :password, with: 'password'
    click_button('submit')
    click_link('Logout')
    expect(page).to not_ have_button('submit')
    expect(page).to have_link 'Login'

  end

  scenario 'a valid user cannot log out if NOT logged in' do
    User.create(name: "Elvis3", email: 'test@example.com', password: 'password', receive_email: 'y')
    visit '/'
    expect(page).to have_no_link 'Logout'
  end

end
