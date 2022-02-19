feature 'Posting a new peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('text', with: 'This is a new peep')
    click_button('Post')

    expect(page).to have_content 'This is a new peep'
  end
end