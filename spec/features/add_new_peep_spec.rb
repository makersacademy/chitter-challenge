feature 'adding new peeps' do
  scenario 'users can add a new peep and see it on the homepage' do
    clean_test_database
    visit('/')
    click_button('Add Peep')
    fill_in 'chitter_user', with: 'Mark'
    fill_in 'new_chitter_message', with: 'just writing some peeps...'
    click_button('Create Peep')
    expect(page).to have_content('just writing some peeps...')
  end
end
