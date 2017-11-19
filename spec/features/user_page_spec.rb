feature 'when visiting user pages' do
  scenario 'shows an error if user does not exist' do
    visit '/abraham'
    expect(page).to have_content('User not found')
  end
end
