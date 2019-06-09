feature 'Authentication' do
  background { truncates }
  # background { add_peep }

  scenario 'user can log into Chitter' do
    User.create('David', '@DavetheDev','dave@gmail.com','Dave1234')
    visit('/sessions/new')
    fill_in('handle', with: '@DavetheDev')
    fill_in('password', with: 'Dave1234')
    click_button('Log in')
    expect(page).to have_content('Welcome, @DavetheDev')
  end
end