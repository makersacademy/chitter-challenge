require 'pg'

feature 'Chitter homepage working' do
  scenario 'can view chitter homepage text' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'all peeps showing on homepage' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep, maker) VALUES ('tester message!', 'Sarah');")
    visit '/'
    expect(page).to have_content "tester message!"
    expect(page).to have_content "Sarah"
  end
end 
