feature 'chitter' do
  scenario 'Add button will take me to adding page' do
    visit('/')
    fill_in'new_peep', with:'This is a new peep'
    click_button 'Add peep'

    expect(page).to have_content('This is a new peep')
  end
end
