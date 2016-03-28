feature 'Chitter feed are reverse chronological order' do
  scenario 'Peeps appear in reverse chronological order' do
    sign_up
    click_button 'Add peep'
    fill_in :message, with: 'First!'
    click_button 'Peep!'
    click_button 'Add peep'
    fill_in :message, with: 'Second!'
    click_button 'Peep!'
    click_button 'Add peep'
    fill_in :message, with: 'Third!'
    click_button 'Peep!'
    expect(page).to have_content("First!")
  end
end
