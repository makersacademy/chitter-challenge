feature 'Add a new Peep' do
  scenario 'A user can share a new Peep' do
    visit('/peeps/add')
    fill_in('peep', with: 'My first Peep!')
    click_button('Submit')

    expect(page).to have_content 'My first Peep!'
  end
end
