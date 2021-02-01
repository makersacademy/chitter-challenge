feature 'Posting a new peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('username', with: 'timmy_toes')
    fill_in('peep', with: 'God I love coding so much I could cry')
    click_button('Post')

    expect(page).to have_content 'timmy_toes'
    expect(page).to have_content 'God I love coding so much I could cry'
  end
end
