require 'pg'

feature 'Viewing peeps' do

  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'visiting the /chitter page' do
    visit('/chitter')
    expect(page).to have_content "Here is a first peep - peep peep"
    expect(page).to have_content "Here is a second peep - peep peep"    
  end

end