require 'pg'

feature 'Writing a new peep' do
  scenario 'Creating and submitting a new peep' do 
    visit('/peep/new')
    fill_in('message', with: 'My first peep message') 
    click_button('Submit')
    expect(page).to have_content "Write a new peep" 
    expect(page).to have_content "My first peep message" 
  end
end


