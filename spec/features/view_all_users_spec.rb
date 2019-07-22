require './spec/helpers/add_users_peeps'
# As a Maker
# So that I can understand who uses the platform
# I want to see a list of all users

feature 'view list of all users' do
  scenario 'list all users' do

    create_users_peeps

    visit('/user')

    expect(page).to have_content('iaquino47')
    expect(page).to have_content('brijake')

  end

  scenario 'so I can post a peep as a user I want a link to my user page' do
    create_users_peeps
    visit('/')
    click_button('View All Users')
    click_link('iaquino47')
    expect(page).to have_content('Hi iaquino47')
  end
end
