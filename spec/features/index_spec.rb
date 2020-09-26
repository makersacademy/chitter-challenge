# feature 'index page' do
#   scenario 'it shows a list of messages' do
#     DatabaseConnection.setup(shore_test)
#     DatabaseConnection.query("TRUNCATE TABLE bottles")
#     DatabaseConnection.query("INSERT INTO bottles (username, body) VALUES (test_user: Hello World);")
#     visit '/'
#     expect(page).to have_content 'test_user: "Hello World"'
#   end
# end