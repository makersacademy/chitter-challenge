feature 'Adding peeps' do
  scenario 'User adds a peep' do
    visit('/peeps/new')

    peep = 'I just made a peep!'
    fill_in('peep', with: peep)
    click_button('Submit')

    expect(page).to have_content peep
  end
end
