require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(content: "This is the first test peep")
    Peep.create(content: "This is the second test peep")
    Peep.create(content: "This is the third test peep")

    visit '/peeps/index'

    expect(page).to have_content "This is the first test peep"
    expect(page).to have_content "This is the second test peep"
    expect(page).to have_content "This is the third test peep"
  end
end