feature 'New peep' do
  scenario 'user creates a new peep and it is added to peeps page' do
    visit '/peeps/new_peep'
    fill_in :text, with: 'Test peep'
    click_button 'Post'
    expect(page).to have_content('Test peep')
  end
end
