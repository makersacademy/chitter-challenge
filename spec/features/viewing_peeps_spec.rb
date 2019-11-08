# As a Maker
# So that I can see what other people are saying
# I want to view peeps on Chitter
feature '1. Viewing Peeps' do
  scenario '1.1 Visiting the index page' do
    visit '/'
    expect(page).to have_content "Chitter"
  end

  scenario '1.2 Viewing peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 1')")
    connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 2')")
    connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 3')")
    visit '/peeps'
    expect(page).to have_content 'This is peep 1'
    expect(page).to have_content 'This is peep 2'
    expect(page).to have_content 'This is peep 3'
  end
end
