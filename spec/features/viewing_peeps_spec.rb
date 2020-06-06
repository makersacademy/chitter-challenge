require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    Peep.create(content: "i need a holiday")
    Peep.create(content: "look at my cat")
    Peep.create(content: "HUNGRY")

    visit('/')

    expect(page).to have_content "i need a holiday"
    expect(page).to have_content "look at my cat"
    expect(page).to have_content "HUNGRY"
  end
end
