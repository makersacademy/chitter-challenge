feature 'Chitter feed are reverse chronological order' do
  scenario 'Peeps appear in reverse chronological order' do
    sign_up
    click_button 'Add peep'
    fill_in :message, with: 'First peep!'
    click_button 'Peep!'
    click_button 'Add peep'
    fill_in :message, with: 'Second peep!'
    click_button 'Peep!'
    expect('Second peep!').to appear_before 'First peep!'
  end
end
