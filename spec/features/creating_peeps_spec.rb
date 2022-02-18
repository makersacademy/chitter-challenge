feature 'Adding a new peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Test peep from the form')
    click_button('Post')

    expect(page).to have_content 'Test peep from the form'
  end
end