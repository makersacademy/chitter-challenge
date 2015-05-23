require_relative 'helpers'

feature 'User logs out' do
  before(:each) do
    User.create(username: 'user01',
                email: 'user01@test.com',
                password: 'test1234')
  end

  scenario 'successfully' do
    login('user01', 'test1234')
    expect(page).to have_content('user01')
    click_button('Logout')
    expect(page).to have_content('Logged out')
  end
end

def login(username, password)
  visit '/sessions/new'
  fill_in('username', with: username)
  fill_in('password', with: password)
  click_button('login2')
end
