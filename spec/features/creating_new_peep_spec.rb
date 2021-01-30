feature 'Adding a new peeps' do
  scenario 'A user can add a new peep' do
    visit('peeps/new')
    fill_in('message', with: 'This is a test peep')
    click_button('Peep')

    expect(page).to have_content('This is a test peep')
  end
end
