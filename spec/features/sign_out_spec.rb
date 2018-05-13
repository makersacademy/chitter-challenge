feature 'signing out' do
  include Helpers
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }

  scenario 'on the index page' do
    visit('/')
    new_user(email, password, name, username)
    log_in(username, password)
    click_button('Log out')
    expect(page).to have_current_path('/')
  end

  scenario 'on /peeps' do
    visit('/')
    new_user(email, password, name, username)
    log_in(username, password)
    click_button('Log out')
    visit('/peeps')
    expect(page).to have_link('Log in')
  end
end
