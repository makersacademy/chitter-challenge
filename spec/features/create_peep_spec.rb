feature 'create new peep' do
  scenario 'page has a form to create a new peep' do
    visit '/home'
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Post peep!'
  end
end
