require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    Peep.create(message: "This is a new peep!")
    visit('/peeps')
  end
end
