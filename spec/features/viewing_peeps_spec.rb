require 'pg'

feature 'Visiting the homepage' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Peep Manager"
  end
end

feature 'Viewing peeps' do
  scenario ' a user can see peeps' do

    Peep.create(peeps: "First Peep", author: "Swarbzz")
    Peep.create(peeps: "Second Peep", author: "Swarbzz")
    Peep.create(peeps: "Third Peep", author: "Swarbzz")

    visit('/peeps')

    expect(page).to have_content("First Peep", "Swarbzz")
    expect(page).to have_content("Second Peep", "Swarbzz")
    expect(page).to have_content("Third Peep", "Swarbzz")
  end
end