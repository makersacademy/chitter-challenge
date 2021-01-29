feature 'See peeps' do
  scenario 'Click to see peeps' do
    visit('/')
    click_button 'See Peeps'
    expect(page).to have_content 'Peep 1Peep 2Peep 3'
  end
end
