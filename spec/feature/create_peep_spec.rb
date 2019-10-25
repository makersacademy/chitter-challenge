feature 'Adding a new peep' do
  scenario 'A user can add a peep to peeps' do
    visit('/peeps/new')
    fill_in('peep', with: 'new test')
    click_button('Submit')

    expect(page).to have_content 'new test'
  end
end
