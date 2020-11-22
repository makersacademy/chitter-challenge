# require 'pg'
feature 'viewing cheeps' do
  scenario 'a user can see cheeps' do
    # connection= PG.connect(dbname: 'chitter_test')

    # connection.exec("INSERT INTO cheeps (text) VALUES('this is a test cheep')")
    visit('/cheeps')
    expect(page).to have_content 'this is a test cheep'
    expect(page).to have_content 'this is a 2nd cheep'
    expect(page).to have_content 'oh, look a third!'
  end
end
