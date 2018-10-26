feature 'Posting a Peep' do
  scenario 'A user can post a Peep to Chitter' do
    visit('/')
    fill_in('message', with: 'A Peep posted by a user')
    click_button('Peep')

    expect(page).to have_content 'A Peep posted by a user'
  end
end
