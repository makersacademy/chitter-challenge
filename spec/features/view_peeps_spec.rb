require 'pg'

feature "View all peeps" do
  scenario "User can view a feed of peeps in reverse chronological order" do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('rorschach12', 'I am not sure if I am qualified to be doing this')")
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('SlowSally123', 'SQL is quite hard eh?!')")
    connection.exec("INSERT INTO peeps (username, peep) VALUES ('AndyH21', 'Why. Just why.')")

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