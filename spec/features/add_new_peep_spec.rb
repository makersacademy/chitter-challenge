feature 'adding new peeps' do
  scenario 'users can add a new peep and see it on the homepage' do
    visit('/')
    click_button('add-peep')
    fill_in 'new-chitter-user', with: 'Mark'
    fill_in 'new-chitter-message', with: 'just writing some peeps...'
    click_button('create-peep')
    expect(page).to have_content('just writing some peeps...')
  end
end
