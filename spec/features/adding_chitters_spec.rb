feature 'Adding peeps' do
    scenario 'User can add Peeps' do 
    connection = PG.connect(dbname: 'chitter_test')
    visit('/chitter')
    fill_in :new_peep, with: 'Had another sandwich today'
    click_button 'Add Peep'
    expect(page).to have_content 'Had another sandwich today'

    end 
end 