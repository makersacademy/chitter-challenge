require 'pg'

feature 'View peeps' do
  scenario 'A user can view peeps' do
    Peep.create(content: "This is my first peep")
    Peep.create(content: "This is my second peep")
    Peep.create(content: "This is my third peep")
    
    visit('/peeps')

    expect(page).to have_content("This is my third peep")
    expect(page).to have_content("This is my second peep")
    expect(page).to have_content("This is my first peep")
  end
end
