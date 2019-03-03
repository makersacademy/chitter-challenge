# feature 'Welcome page' do
#   scenario 'user arrives at site and sees welcome message' do
#     visit '/'
#     expect(page).to have_content "Welcome to Chitter!"
#   end
# end

feature 'View peeps' do
  scenario 'allows Maker to see peeps' do
    connection = PG.connect(dbname: 'makers_peeps_test')

    connection.exec("INSERT INTO peeps (message) VALUES('Sunday brunch');")
    connection.exec("INSERT INTO peeps (message) VALUES('Tea and toast');")

    visit '/peeps'
    expect(page).to have_content 'Sunday brunch'
    expect(page).to have_content 'Tea and toast'
  end
end
