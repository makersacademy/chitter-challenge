feature 'Add a new peep' do
  scenario 'user can post a new peep to Chitter' do
    visit 'peeps/new'
    fill_in 'peep', with: 'Test Peep'
    click_button 'Submit'
    expect(page).to have_content 'Test Peep'
  end
end
