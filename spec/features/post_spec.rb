require './lib/database_connection'

feature 'post page' do
  scenario 'a user can post a message' do
    clear_table("bottles")                
    visit '/bottle'
    fill_in 'body', with: 'Hello World!'
    click_button 'Throw Bottle'
    expect(page).to have_content 'Hello World!' 
  end
end
