require 'pg'

feature 'Viewing chitters' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'A user can view chitters' do
    # Add the test data

    time = Time.new.to_s[0...-6]

    Peep.create(message: "Test peep 1")
    Peep.create(message: "Test peep 2")
    Peep.create(message: "Test peep 3")
    
    visit('/peeps')

    expect(page).to have_content "Test peep 1"
    expect(page).to have_content "Test peep 2"
    expect(page).to have_content "Test peep 3"

    expect(page).to have_content time
  end
end