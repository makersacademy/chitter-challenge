require 'pg'

feature 'Viewing Peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname:'chitter_test')
    connection.exec("INSERT INTO peeps (content) VALUES ('First peep here!');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Second peep is also here!');")

    visit('/chitter')

    # fill_in 'username', with: 'Becc'
    # fill_in 'content', with: 'Post some peeps here!'
    # click_button 'Add a Peep'
    # expect(page).to have_content "Post some peeps here!"
    expect(page).to have_content "First peep here!"
    expect(page).to have_content "Second peep is also here!"
  end
end
