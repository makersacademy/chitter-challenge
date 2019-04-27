feature 'Creating a peep' do
  scenario 'A user can create a peep' do
    visit('/peeps/new')
    fill_in('text', with: 'Peep3')
    click_button('Post Peep')
    expect(page).to have_content 'Peep3'
  end
end
