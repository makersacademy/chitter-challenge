feature 'Viewing homepage' do

  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    Chitter.peep('First peep')
    Chitter.peep('Second peep')
    Chitter.peep('Third peep')

    visit('/')

    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_content "First peep"
    expect(page).to have_content "Second peep"
    expect(page).to have_content "Third peep"
  end

end
