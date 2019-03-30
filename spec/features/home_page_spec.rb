# home page

feature 'Viewing home page' do
  scenario 'Introductory title' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
    expect(page).to have_content 'Peeps'
  end
end

# feature 'Viewing homepage' do
#   scenario 'See Peepdeck' do
#     connection = PG.connect(dbname: 'peep_manager_test')
#     connection.exec("INSERT INTO peep VALUES(1, 'My first peep');")
#     visit('/')
#     expect(page).to have_content 'My first peep'
#   end
# end
