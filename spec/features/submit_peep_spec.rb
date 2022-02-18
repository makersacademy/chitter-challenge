feature 'submit peep' do
  scenario 'it submits a peep' do
    visit '/'
    fill_in :peep, with: 'Hello mate'
    click_button 'PEEP!'
    expect(page).to have_content 'Hello mate'
  end
end
