require 'pg'

feature 'view peeps on Chitter' do
  scenario 'user is able to view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Chitter.post(peep: "hello world")
    Chitter.post(peep: "this is your timeline")
    Chitter.post(peep: "peeps from other users are here")

    visit ('/timeline')
    expect(page).to have_content "hello world"
    expect(page).to have_content "this is your timeline"
    expect(page).to have_content "peeps from other users are here"
  end
end