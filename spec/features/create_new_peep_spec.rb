feature 'Create a new peep' do
  scenario 'User adds a peep and is showed peep on the next page' do
    visit '/peeps/new'

    fill_in 'text', with: 'Test peep'
    click_button 'Post Peep!'
    expect(page).to have_content 'Test peep'
  end
end
