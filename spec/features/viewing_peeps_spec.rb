require 'pg'

feature "peeps" do
  scenario "user can see a peep" do
    # connection = PG.connect(dbname: 'chitter_test')
    # # Add the test data
    # connection.exec("INSERT INTO peeps VALUES (1, 'So nice to be on chitter');")
    Peep.create(peep: "So nice to be on chitter")
    visit('/peeps')

    # expect(page).to have_content("timmy_toes")
    expect(page).to have_content("So nice to be on chitter")
  end
end
