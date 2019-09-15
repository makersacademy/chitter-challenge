feature 'Add peep' do
  scenario 'user can add a peep' do
    connection = PG.connect(dbname: 'peeps_test')
    connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good morning!');")
    connection.exec("INSERT INTO peeps_library (peeps) VALUES('Good evening!');")
    visit('/')
    click_button 'Add Peep'
    fill_in 'peep', :with => 'Good evening!'
    click_button 'Submit'
    expect(page).to have_content 'Good evening!'
  end
end
