require 'pg'

feature 'Navigates to stream' do
  scenario 'user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES ('My second peep!')")

    visit "/chitter/new"
    click_button "Post"

    expect(page).to have_content "My second peep!"
  end
end
