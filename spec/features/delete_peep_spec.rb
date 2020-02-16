feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Peep.create(text: 'lets delete this')
    visit('/')
    expect(page).to have_content('lets delete this')

    click_button 'Delete'
    expect(current_path).to eq '/'
    expect(page).not_to have_content('lets delete this')
  end
end