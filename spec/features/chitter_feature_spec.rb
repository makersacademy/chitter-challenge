feature 'Test access to Chitter homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing Posts' do
  scenario 'A user can see Posts' do
    connection = PG.connect(dbname: 'chitter_db_test')

    connection.exec("INSERT INTO messages (peep, tag) VALUES ('It was a great week at Makers!', '@Br0ckers');")
    connection.exec("INSERT INTO messages (peep, tag) VALUES ('We learned about databases!', '@Br0ckers');")
    connection.exec("INSERT INTO messages (peep, tag) VALUES ('databases suck!', '@Br0ckers');")

    visit('/')
    click_link('See Peeps')
    expect(page).to have_content 'It was a great week at Makers!', '@Br0ckers'
    expect(page).to have_content 'We learned about databases!', '@Br0ckers'
    expect(page).to have_content 'databases suck!', '@Br0ckers'
  end
end


feature 'Adding Posts' do
  scenario 'A user can add a Post' do
    connection = PG.connect(dbname: 'chitter_db_test')

    visit('/')
    click_link('Post a new Peep')
    fill_in('MESSAGE', :with => 'Saturday morning I worked on my Friday challenge!')
    fill_in('TAG', :with => '@Br0ckers')
    click_button('Submit Post')
    # expect(page).to have_link('BBC', href: "http://www.bbc.co.uk")
    expect(page).to have_content('Saturday morning I worked on my Friday challenge!', '@Br0ckers')
  end
end

feature 'Registering a new User' do
  scenario 'An individual can register themselves' do
    connection = PG.connect(dbname: 'chitter_db_test')

    visit('/')
    click_link('Sign up')
    fill_in('USERNAME', :with => 'Neil')
    fill_in('TAG', :with => 'Br0ckers')
    click_button('Add User')
    expect(page).to have_content('Welcome Neil Your registration is now complete')
  end
end
