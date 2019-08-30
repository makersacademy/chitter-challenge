# feature 'Viewing Chitter Page' do
#   scenario 'visiting the index page' do
#     visit('/')
#     expect(page).to have_content "Chitter Page"
#   end
# end
require 'chitter'
require 'pg'

feature 'Viewing posts' do
  scenario 'A user can see all posts' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO chitter VALUES(1, 'Hello');")
    connection.exec("INSERT INTO chitter VALUES(2, 'How are you today?');")
    visit('/chitter')
    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you today?"
  end
end

feature 'Adding a new post' do
  scenario 'A user can add a post to Chitter Manager' do
    fill_in('message', with: 'Goodbye')
    click_button('Submit')
    expect(page).to have_content 'Goodbye'
  end
end
