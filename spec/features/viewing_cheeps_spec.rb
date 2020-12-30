feature 'Viewing cheeps' do
  scenario 'visiting the cheep feed' do
    connection = PG.connect(dbname: 'cheeps_test_database')

    Cheep.create(author: 'Jason', message: 'First cheep')
    Cheep.create(author: 'Lisa', message: 'Second cheep')
    Cheep.create(author: 'Zoe', message: 'Third cheep')
    
    visit('/cheep_feed')

    expect(page).to have_content ("First cheep")
    expect(page).to have_content ("Second cheep")
    expect(page).to have_content ("Third cheep")
  end
end