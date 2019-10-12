feature 'Creating peeps' do
  scenario '-entering a peep' do
    visit '/chitter'
    fill_in('peep', with: 'Woohoo I have written a peep')
    click_button 'Submit'

    expect(page).to have_content('Woohoo I have written a peep')
  end
end
