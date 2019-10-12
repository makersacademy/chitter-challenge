feature 'Posting a peep' do
  scenario 'A new peep can be posted' do
    visit ('/peep/new')
    fill_in('post peep', with: 'A new peep')
    click_button('Peep!')

    expect(page).to have_content 'A new peep'
  end
end