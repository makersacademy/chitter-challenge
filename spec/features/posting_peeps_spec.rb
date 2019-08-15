require 'pg'

feature 'adding a new peep' do
  scenario 'a user can post a peep' do
    visit ('/')
     fill_in('content', with: 'This is my first peep')
     click_button "submit"

     expect(page).to have_content "This is my first peep"
  end
end
