feature 'Creating a Peep' do
  scenario 'A user can create a Peep' do
    visit('/')
    click_button('Create A Peep')
    fill_in('peep_content', with: 'First Peep')
    click_button('Peep')

    expect(page).to have_content('First Peep')
  end
end