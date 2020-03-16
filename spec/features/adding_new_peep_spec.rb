feature 'submitting a new peep' do
  scenario 'user can submit a new peep using a form' do
    visit('/new')
    fill_in('message', with: 'test peep message')
    click_button('Peep')

    expect(page).to have_content('test peep message')
  end
end
