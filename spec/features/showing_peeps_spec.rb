feature 'showing all peeps' do
  scenario 'user sees all peeps' do
    visit('/peeps')
    
    expect(page).to have_content "Test Peep 1"
    expect(page).to have_content "Test Peep 2"
    expect(page).to have_content "Test Peep 3"
  end
end
