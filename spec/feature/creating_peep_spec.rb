feature 'Creating peeps' do
  scenario 'I can create a new peep' do
    visit('/peeps/new')
    fill_in 'peep', with: "Testers Academy"
    click_button 'Add peep'
    expect(current_path).to eq '/peeps'

    # within 'ul#peeps' do
    #   expect(page).to have_content('Testers Academy')
    # end
  end
end
