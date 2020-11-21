feature "Post new peep" do
  scenario "User can post a new peep" do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('rorschach12', 'I am not sure if I am qualified to be doing this')")
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('SlowSally123', 'SQL is quite hard eh?!')")
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('AndyH21', 'Why. Just why.')")
    
    visit '/peeps'
    expect(page).not_to have_content 'testuser'
    expect(page).not_to have_content "This is a new pepe! And shouldn't be here until created."
    click_link('Peep')
    expect(current_path).to eq '/peeps/new'
    fill_in('username', with: 'testuser')
    fill_in('peep', with: 'This is a new pepe! And shouldn\'t be here until created.')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'testuser'
    expect(page).to have_content 'This is a new pepe! And shouldn\'t be here until created.'

  end
end