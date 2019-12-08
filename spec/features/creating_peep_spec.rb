feature 'Peep' do
  scenario 'A user can create a multiple peeps' do
    siggning_in
    fill_in 'text', with: 'random peep'
    fill_in 'text', with: 'random peep 2'
    click_button 'Submit'
    expect(page).to have_content 'random peep'
    expect(page).to have_content 'random peep 2'
  end
end
