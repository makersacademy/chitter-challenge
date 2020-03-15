require 'pg'

feature 'viewing chitter' do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content("Chitter")
  end
end

feature 'looking at peeps' do
  scenario 'user can see peeps' do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 1');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 2');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('test peep 3');")
    
    
    visit ('/view-peeps')
    expect(page).to have_content "test peep 1"
    expect(page).to have_content "test peep 2"
    expect(page).to have_content "test peep 3"
  end

  



end