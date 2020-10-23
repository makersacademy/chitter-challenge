feature 'viewing a peep' do
  scenario 'a user can view a peep on chitter' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Weekend vibes');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('insert funny peep here');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('Happy Friday!');")

    visit '/chitter'

    expect(page).to have_content('Weekend vibes')
    expect(page).to have_content('insert funny peep here')
    expect(page).to have_content('Happy Friday!')
  end
end
