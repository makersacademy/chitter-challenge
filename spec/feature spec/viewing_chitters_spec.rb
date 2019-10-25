require 'pg'
require 'peep'

feature 'Viewing Peeps' do
  scenario 'a User can see the Peeps' do
    connection = PG.connect(dbname: 'Chitter_test')
    Peep.add(content: "Actually Dont agree with you @EllenShow")
    visit('/home')

    expect(page).to have_content "Actually Dont agree with you @EllenShow"
  end
end
