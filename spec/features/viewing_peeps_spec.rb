require 'pg'

feature 'viewing peeps' do
  scenario 'user can see peeps' do
    Peep.create(content: "First Peep!")
    Peep.create(content: "Second Peep!")

    visit('/peeps')

    expect(page).to have_content 'First Peep!'
    expect(page).to have_content 'Second Peep!'
  end
end
