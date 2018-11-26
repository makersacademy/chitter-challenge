
feature '.list' do
  scenario "It shows the list of users" do
    User.create(email: 'test1@example.com', password: 'password123', name: 'test1', username: 'bravo')
    User.create(email: 'test2@example.com', password: 'password124', name: 'test2', username: 'foxtrot')
    User.create(email: 'test3@example.com', password: 'password125', name: 'test3', username: 'tango')
    User.create(email: 'test4@example.com', password: 'password126', name: 'test4', username: 'sierra')

    visit '/peeps'

    expect(page).to have_content("Users:")
    expect(page).to have_content('bravo')
    expect(page).to have_content('foxtrot')
    expect(page).to have_content('tango')
    expect(page).to have_content('sierra')
  end
end
