feature 'Peeping' do
  scenario 'Posting a new peep' do
    register_user
    click_button 'New Peep'
    fill_in 'new_peep', with: 'Test peep'
    click_button 'Peep'
    expect(page).to have_content 'Test peep'
  end
end
