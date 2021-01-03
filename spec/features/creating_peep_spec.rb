feature 'Adding a peep' do
  scenario 'A user can peep out a message' do
    visit('/')
    fill_in('peep', with: 'Once upon a time...')
    click_button('Submit')

    expect(page).to have_content 'Once upon a time...'
  end
end
