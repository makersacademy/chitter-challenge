require 'pg'

ffeature 'show peeps' do
  scenario 'on /peeps' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec "INSERT INTO peeps(text) VALUES('My first peep yoooo')"
    connection.exec "INSERT INTO peeps(text) VALUES('Just got this peep app! unbelievable!')"
    connection.exec "INSERT INTO peeps(text) VALUES('Peep is kicking off!')"
    visit('/peeps')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep yoooo')
    expect(page).to have_text('Just got this peep app! unbelievable!')
    expect(page).to have_text('Peep is kicking off!')
  end
end
