feature 'add peep' do
  scenario 'visiting the index page' do
    visit('/chitter/peeps')
   expect(page).to have_content 'Chitter Challenge'    
  end
end