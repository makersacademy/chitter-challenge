feature 'Viewing peeps.' do
  scenario 'A user can view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # test data
    Peep.create(peep: "first peep", username: "Josh")
    Peep.create(peep: "second peep", username: "Josh")
    Peep.create(peep: "third peep", username: "Josh")

    visit('/peeps')

    expect(page).to have_content "first peep"
    expect(page).to have_content "second peep"
    expect(page).to have_content "third peep"
    expect(page).to have_content "Josh"
  end
end
