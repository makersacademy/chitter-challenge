feature 'Viewing peeps' do
  scenario 'user wants to see peeps in reverse chronological order' do
    Peep.create('First test peep')
    Peep.create('Second test peep')
    visit('/peeps')
    
    expect(page).to have_content('First test peep')
    expect(page).to have_content('Second test peep')
    expect(first('.peep')).to have_content 'Second test peep'
  end
end
