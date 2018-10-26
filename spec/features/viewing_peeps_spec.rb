require 'pg'

feature 'Feature - Viewing Peeps' do
  scenario 'A user can see Peeps' do
    Peep.post_peep(message: "This is a peep")
    Peep.post_peep(message: "This is another peep")
    Peep.post_peep(message: "This is a third peep")

    visit('/')

    expect(page).to have_content "This is a peep"
    expect(page).to have_content "This is another peep"
    expect(page).to have_content "This is a third peep"
  end
end
