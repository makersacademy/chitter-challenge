feature 'Allowing the user to post a peep' do
  scenario 'Ensuring the page has a field and button to post a peep' do
    visit '/home'
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Post Peep!'
  end
end
