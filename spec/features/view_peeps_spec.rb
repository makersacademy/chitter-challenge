feature 'Viewing peeps' do
  scenario 'User goes to Chitter main page to view peeps' do

    connection = PG.connect(dbname: 'chitter_app_test')

    # Add the test data
    Peep.create(peep: "Peep 1 by Pusheen")
    Peep.create(peep: "Peep 2 by Gudetama")
    Peep.create(peep: "Peep 3 by Yoda")

    visit('/peeps')

    expect(page).to have_content "Peep 1 by Pusheen"
    expect(page).to have_content "Peep 2 by Gudetama"
    expect(page).to have_content "Peep 3 by Yoda"
  end
end
