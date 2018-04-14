require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see all peeps that have been made' do
    Peep.create(peep: "Hello World")
    Peep.create(peep: "Hey, what is happening people")

    visit('/peeps')

    expect(page).to have_content "Hello World"
    expect(page).to have_content "Hey, what is happening people"
  end
end
