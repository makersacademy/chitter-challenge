require_relative '../helpers/add_users_peeps'

# As a Maker
# So that I can understand who uses the platform
# I want to see a list of all users

feature 'view list of all users' do
  scenario 'list all users' do

    create_users_peeps

    visit('/user')

    expect(page).to have_content('JD')
    expect(page).to have_content('MZ')

  end
end