# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature "View all in reverse chronological order" do
  scenario "The homescreen shows all peeps" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO post (content) VALUES('My first Peep');")
    connection.exec("INSERT INTO post (content) VALUES('My second Peep');")
    
    visit('/')
    
    expect(page).to have_content "My second Peep"
  end
end