feature 'Viewing Peeps' do
  scenario 'A user can see their Peeps' do
    visit('/peeps')
    expect(page).to have_content "Dear diary"
    expect(page).to have_content "Feeling blue"
    expect(page).to have_content "Happy thoughts"
  end
end

require 'pg'

feature 'Viewing Peeps' do
  scenario 'A user can see Peeps' do
    connection = PG.connect(dbname: 'Chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, '15:40:00', 'Dear diary');")
    connection.exec("INSERT INTO peeps VALUES(2, '15:41:00', 'Feeling blue');")
    connection.exec("INSERT INTO peeps VALUES(3, '15:42:00', 'Happy thoughts');")

    visit('/peeps')

    expect(page).to have_content "Dear diary"
    expect(page).to have_content "Feeling blue"
    expect(page).to have_content "Happy thoughts"
  end
end
