require 'pg'

feature 'Viewing peeps' do
  scenario 'view peeps' do
    Peep.add("I'm having a nice day")
    Peep.add("I like cats")
    visit('/')
    expect(page).to have_content("I'm having a nice day")
  end
end