# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'Authentication' do
  it 'A user can sign in' do
    User.create(name: 'Joe Bloggs',
                username: 'jblogg',
                email: 'joe@bloggs.com',
                password: 'jamesbond007')

    visit '/sessions/new'
    fill_in :username, with: 'jblogg'
    fill_in :password, with: 'jamesbond007'
    click_button 'Sign in'

    expect(page).to have_content 'Welcome, jblogg'
  end
end
