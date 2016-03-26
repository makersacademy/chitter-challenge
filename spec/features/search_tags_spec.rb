feature 'search tags' do
  scenario 'Being able to search for different tags' do
    add_chit('hey','hello')
    add_chit('omg, second tweet','shock')
    add_chit('chitter is amazing','amazing')
    add_chit('goodbye forever','amazing')

    visit '/search/amazing'

    link = Chit.first
    expect(page).to have_content('chitter is amazing')
    expect(page).to have_content('goodbye forever')
    expect(page).not_to have_content('omg, second tweet')
    expect(page).not_to have_content('hey')
  end
end
