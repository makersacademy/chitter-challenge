feature 'user can see list of peeps' do
  scenario 'user create some peeps, and they are displayed on homepage' do

    DatabaseConnection.query("INSERT INTO peeps VALUES(1, 'my first peep');")
    DatabaseConnection.query("INSERT INTO peeps VALUES(2, 'my second peep');")
    DatabaseConnection.query("INSERT INTO peeps VALUES(3, 'my third peep');")

    visit('/')

    expect(page).to have_content "my first peep"
    expect(page).to have_content "my second peep"
    expect(page).to have_content "my third peep"
  end
end
