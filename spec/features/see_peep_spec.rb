feature 'See peep' do
  scenario 'I can see my posted peep' do
    visit '/'
    fill_in :peep, with: 'My first peep'
    click_button 'Peep!'
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end
end
