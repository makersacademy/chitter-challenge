feature 'Posting a peep' do
  scenario 'view posted peep' do
    visit('/peeps/new')
    fill_in('text', with: "Test peep text")
    click_button('Peep')

    expect(page).to have_content("Test peep text")
  end
end
