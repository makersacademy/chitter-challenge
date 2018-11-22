connection = PG.connect(dbname: 'bookmark_manager_test')

feature 'posting a new peep to chitter' do
  scenario 'User writes a new peep and it can be viewed on the screen' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit (/)
    fill_in 'message' with: 'Hello World!'
    click_button 'Post'
    expect(page).to have_content 'Hello World!'
  end
end
