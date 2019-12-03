feature 'check the home page is working' do
  scenario 'go to the home page and check it works' do
    visit '/'
    expect(page).to have_content "Chitter Challenge!"
  end
end

feature 'reading chitter messages' do
scenario 'go to the chitter page and read the chitter messages' do

  connection = PG.connect(dbname: 'chitter_challenge_test')

  connection.exec("INSERT INTO chitters VALUES(1, 'Test Chitter Message');")
    connection.exec("INSERT INTO chitters VALUES(2, 'Another test chitter');")
    connection.exec("INSERT INTO chitters VALUES(3, 'yet another test chitter');")
  visit '/chitter'
  expect(page).to have_content "Test Chitter Message"
  expect(page).to have_content "Another test chitter"
  expect(page).to have_content "yet another test chitter"
end
end

# feature 'peeps should be in the reverse order' do
#   scenario 'I want to read the latest peeps last' do
#     Chitter.create(peep: "First peep")
#     Chitter.create(peep: "Second peep")
#     visit '/chitter'
# expect(page).to start_with "Second peep"
#   end
# end
