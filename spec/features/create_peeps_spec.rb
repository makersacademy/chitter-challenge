require 'pg'

feature 'Create new peep' do
  scenario 'User can write a new peep and post it to timeline' do
    visit('/peeps/new')
    fill_in('text', with: "dummy peep text")
    fill_in('name', with: "Finn")
    click_button('Post')
    
    expect(current_path).to eq '/peeps/timeline'
    expect(page).to have_content "dummy peep text"
    
  end
end