feature 'lists peeps' do
  scenario 'lists last added peep' do
    add_new_peep
    expect(page).to have_content('Happy it\'s saturday')
  end
end
