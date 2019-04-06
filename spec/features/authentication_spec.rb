# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Authentication' do
  before do
    User.create(name: 'Joe Bloggs',
                username: 'jblogg',
                email: 'joe@bloggs.com',
                password: 'jamesbond007')
  end

  scenario 'A user can sign in' do
    visit '/sessions/new'
    fill_in :username, with: 'jblogg'
    fill_in :password, with: 'jamesbond007'
    click_button 'Sign in'
    expect(page).to have_content 'Hello, jblogg'
  end

  scenario 'It shows an error if you put in the wrong password' do
    visit '/sessions/new'
    fill_in :username, with: 'jblogg'
    fill_in :password, with: 'a_wrong_password'
    click_button 'Sign in'
    expect(page).to have_content "Sorry, we didn't recognise those details"
  end

  scenario 'It shows an error if you put in an invalid username' do
    visit '/sessions/new'
    fill_in :username, with: 'some_random_username'
    fill_in :password, with: 'jamesbond007'
    click_button 'Sign in'
    expect(page).to have_content "Sorry, we didn't recognise those details"
  end
end
