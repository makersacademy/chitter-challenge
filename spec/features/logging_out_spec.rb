# User Story Three
#
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'log out' do
  before do
    User.create(
      name:                   'Test User Name',
      email:                  'test@test.com',
      password:               'qwerty',
      password_confirmation:  'qwerty')
  end

  scenario 'user can log out' do
    log_in_existing_user
    click_button 'log out'
    expect(page).to have_content 'See you soon!'
    expect(page).not_to have_content 'Welcome'
  end
  scenario 'user can log out only if he logged in' do
    visit ('/peeps')
    expect(page).not_to have_button 'log out'
  end
end
