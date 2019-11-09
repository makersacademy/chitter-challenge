require 'pg'
require 'orderly'

feature 'viewing peeps' do
  scenario 'user can see all peeps in reverse chronological order' do

    Peeps.create(peep: 'hi there')
    Peeps.create(peep: 'how are you today?')

    visit '/peeps'
    expect('how are you today?').to appear_before('hi there')
  end
end
