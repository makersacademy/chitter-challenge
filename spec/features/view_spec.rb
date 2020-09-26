feature 'viewing a peep' do 
  scenario 'user can view peeps' do 
    visit('/')
    expect(page).to have_content('Latest Peeps')
    expect(page).to have_content('First Peep')
    expect(page).to have_content('Second Peep')
  end 
end 