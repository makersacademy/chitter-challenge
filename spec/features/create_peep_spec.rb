feature 'Add new peep' do
  scenario 'user can write and submit a peep' do
    visit('/new-peep')
    fill_in('peep', with: "test peep 4")
    click_button('Peep!')

    expect(page).to have_content 'test peep 4'
  end
end

