feature 'Enter peep' do
  scenario 'submitting peep' do
    visit('/')
    fill_in :peep, with: 'This is my first peep'
    click_button 'Peep!'
    expect(page).to have_content 'This is my first peep'
  end
end
