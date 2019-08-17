require 'pg'

feature 'adding a new peep' do

  scenario 'a user can post a peep' do
    User.create(email: 'test@email.com', username: 'testusername', name: 'Test Name', password: 'Test Password')
    visit ('/sessions/new')
    fill_in(:email, with:'test@email.com')
    fill_in(:password, with: 'Test Password')
    click_button('Sign In')
    
     fill_in('content', with: 'This is my first peep')
     click_button "submit"

     expect(page).to have_content "This is my first peep"
  end
end
