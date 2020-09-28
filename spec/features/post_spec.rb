require './lib/database_connection'

feature 'post page' do
  scenario 'a user can post a message' do
    clear_table("bottles") 
    visit '/login'
    fill_in 'username', with: 'fluffybunny82'
    fill_in 'name', with: 'Jemima Rabbit'
    fill_in 'email', with: 'bunny@hotmail.com'
    fill_in 'password', with: 'fluffer82'
    click_button 'Register'            
    visit '/bottle'
    fill_in 'body', with: 'Hello World!'
    click_button 'Throw Bottle'
    expect(page).to have_content 'Hello World!' 
  end
end
