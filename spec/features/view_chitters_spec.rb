require 'pg'

feature 'Viewing chitters' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can view chitters' do
    # Add the test data
    Peep.create(message: "Test peep 1")
    Peep.create(message: "Test peep 2")
    Peep.create(message: "Test peep 3")
    
    visit('/peeps')

    expect(page).to have_content "Test peep 1"
    expect(page).to have_content "Test peep 2"
    expect(page).to have_content "Test peep 3"
  end
end