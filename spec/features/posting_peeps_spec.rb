feature 'Posting a new peep' do
  scenario 'A user can post peeps in Chitter' do
    visit('peeps/new')
    fill_in('content', with: 'Third post, databases are fun but hard.')
    fill_in('user_name', with: 'Tomas')
    click_button('Post')

    expect(page).to have_content 'Third post, databases are fun but hard.'
    expect(page).to have_content 'Tomas'
  end
end