feature 'Feature - Posting a Peep' do
  scenario 'A non-logged in user cannot post a Peep to Chitter' do
    visit('/')
    expect(page).not_to have_selector("#peep-form")
  end

  # scenario 'A user can post a Peep to Chitter' do
  #   visit('/')
  #   fill_in('message', with: 'A Peep posted by a user')
  #   click_button('Peep')
  #
  #   expect(page).not_to have_content 'A Peep posted by a user'
  # end
end
