feature 'Viewing cheeps' do
  scenario 'visiting the cheep feed' do
    connection = PG.connect(dbname: 'cheeps_test_database')

    Cheep.create(message: 'First cheep')
    Cheep.create(message: 'Second cheep')
    Cheep.create(message: 'Third cheep')
    
    visit('/cheep_feed')
    expect(page).to have_content "First cheep Second cheep Third cheep"
  end
end