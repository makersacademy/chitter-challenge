feature 'creating peeps' do
  scenario 'user can create a peep' do

    visit('/new')
    fill_in :display_name, with: 'Test user'
    fill_in :peep, with: 'Test peep'
    click_button 'Post peep'
    expect(page).to have_content "Test user"
    expect(page).to have_content "Test peep"

  end
end