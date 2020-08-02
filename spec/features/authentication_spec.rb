require 'database_helpers'

feature 'Authentication' do
  scenario 'user signs into registered user account' do
    create_user
    visit('/sessions/new')
    fill_in('email', with: 'test@makers.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).to have_content("Logged in as: test@makers.com")
  end
end
