feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter feed' do
    visit('/peeps/new')
    fill_in('message', with: 'peeps')
    click_button('Post')

    expect(page).to have_content 'peeps'
  end
end