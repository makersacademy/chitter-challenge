# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Log in to Chitter' do

  scenario 'A user can log in' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    visit('/')
    # find('.loginshow').click
    fill_in :username, with: 'peeper1234'
    fill_in :password, with: 'p4s5w0rd'
    find('#Login').click
    # click_on(class: 'login_btn')
    expect(page).to have_content "Welcome to Chitter, peeper1234"
  end

  scenario 'login does not work if no matching user' do
    User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test@test.com")
    visit('/')
    fill_in :username, with: 'peeper1234'
    fill_in :password, with: 'p4s5w0rd-wrong'
    find('#Login').click
    # click_on(class: 'login_btn')
    expect(page).to have_content "Incorrect username or password. Please try again"
    expect(page).to_not have_content "Welcome to Chitter, peeper1234"
  end
end
