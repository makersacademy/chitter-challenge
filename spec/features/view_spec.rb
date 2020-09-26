feature 'viewing a peep' do 
  scenario 'user can view peeps' do
    add_peeps_db
     
    visit('/')
    expect(page).to have_content('Latest Peeps')
    expect(page).to have_content('first peep')
    expect(page).to have_content('second peep')
  end 
end 