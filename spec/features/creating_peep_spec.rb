feature 'Adding a new peep' do
  scenario 'A user can add a peep to the stream' do
    visit('/peeps')
    click_link('Add peep')
    fill_in('peep', with: 'Test peep')
    click_button('Submit')

    expect(page).to have_content 'Test peep'
  end
end
