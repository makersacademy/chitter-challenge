feature 'View all peeps' do
  scenario 'A user can see all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    # add test data
    connection.exec("INSERT INTO peeps (user_handle,post) VALUES ('leonardo_dicaprio', 'Hello World!');")
    connection.exec("INSERT INTO peeps (user_handle,post) VALUES ('meryl_streep', 'I am feeling sunny today!');")
    connection.exec("INSERT INTO peeps (user_handle,post) VALUES ('bob', 'Minions will takeover the world.');")
    
    visit '/'
    expect(page).to have_content "leonardo_dicaprio", "Hello World!"
    expect(page).to have_content "meryl_streep", "I am feeling sunny today!"
    expect(page).to have_content "bob", "Minions will takeover the world."
  end
end
