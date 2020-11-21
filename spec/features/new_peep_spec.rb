feature "Post new peep" do
  scenario "User can post a new peep" do

    connection = PG.connect(dbname: 'chitter_test')
    Peeps.create(username: 'rorschach12', peep: 'I am not sure if I am qualified to be doing this')
    Peeps.create(username: 'SlowSally123', peep: 'SQL is quite hard eh?!')
    Peeps.create(username: 'AndyH21', peep: 'Why. Just why.')
    
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