require 'pg'
require_relative 'web_helpers'

feature "View all peeps" do
  scenario "User can view a feed of peeps in reverse chronological order" do

    connection = PG.connect(dbname: 'chitter_test')
    Peeps.create(username: 'rorschach12', peep: 'I am not sure if I am qualified to be doing this')
    Peeps.create(username: 'SlowSally123', peep: 'SQL is quite hard eh?!')
    Peeps.create(username: 'AndyH21', peep: 'Why. Just why.')
    
    visit '/'
    click_link('Chitter Feed')
    expect(current_path).to eq '/peeps'

    expect(page).to have_content "AndyH21"
    expect(page).to have_content "Why. Just why."
    expect(page).to have_content "SlowSally123"
    expect(page).to have_content "SQL is quite hard eh?!"
    expect(page).to have_content "rorschach12"
    expect(page).to have_content "I am not sure if I am qualified to be doing this"
  end
end