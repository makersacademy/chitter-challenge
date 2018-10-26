feature 'posting a peep' do
  before do
    sign_up_as_alice_bobson
  end

  scenario 'shows the peep on screen after posting' do
    fill_in :peep_entry, with: 'My first peep'
    click_button 'Peep'
    expect(page).to have_content 'My first peep'
  end

  scenario 'shows error message if peep text is empty' do
    click_button 'Peep'
    expect(page).to have_content 'Please enter text before peeping!'
  end
end
