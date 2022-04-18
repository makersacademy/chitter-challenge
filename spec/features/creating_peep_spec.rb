feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('content', with: 'peep 4')
    click_button('Submit')

    expect(page).to have_content 'peep 4'
  end
end
