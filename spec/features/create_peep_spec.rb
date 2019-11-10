feature 'creating a peep' do
  scenario 'user visits peep page' do
    visit('/new-peep')
    expect(page).to have_content "Peep your thoughts."
    fill_in('peep', with: 'This is another test peep 4.')
    click_button('Peep that!')

    expect(page).to have_content 'This is another test peep 4.'
  end
end
