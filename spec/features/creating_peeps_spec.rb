feature ' Adding a new peep' do
  scenario 'A user can add a peep' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello there')
    click_button('Peep')

    expect(page).to have_content 'Hello there'
  end
end