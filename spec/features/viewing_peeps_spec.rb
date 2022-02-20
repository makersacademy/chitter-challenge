require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a new peep!');")
    visit('/peeps')
    expect(page).to have_content "This is a new peep!"
  end
end




# feature 'post a peep' do
#   scenario 'a user can post a new peep' do
#     visit ('/peeps/new')
#     fill_in 'peep', with: 'This is a new peep!'
#     #fill_in 'user', with: 'Sarah'
#     click_button 'Post peep'
#     #expect(page).to have_content('This is a new peep!')
#   end

