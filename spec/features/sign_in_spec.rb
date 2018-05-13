feature 'signing in' do
  include Helpers
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }

  before do
    visit('/')
    new_user(email, password, name, username)
  end

  scenario 'correct inputs' do
    log_in(username, password)
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content(name)
    expect(page).to have_content("@#{username}")
    expect(page).not_to have_link('Log in')
  end

  scenario 'incorrect password' do
    log_in(username, 'incorrect_password')
    expect(page).to have_current_path('/')
    expect(page).to have_text('Incorrect password')
  end

  scenario 'incorrect username' do
    log_in('incorrect username', password)
    click_button('Log in')
    expect(page).to have_current_path('/')
    expect(page).to have_text('Incorrect username')
  end

  scenario 'from /peeps' do
    visit('/peeps')
    click_link('Log in')
    log_in(username, password)
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content(name)
  end
end
