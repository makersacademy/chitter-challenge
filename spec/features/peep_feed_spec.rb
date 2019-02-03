feature 'Peep feed' do
  scenario 'Peeps display in reverse cronological order' do
    register_user
    click_button 'New Peep'
    fill_in 'new_peep', with: 'Test peep'
    click_button 'Peep'
    click_button 'New Peep'
    fill_in 'new_peep', with: 'New test peep'
    click_button 'Peep'
    expect(page).to have_content 'New test peep Test User at ' + Time.now.to_s + ' Test peep Test User at ' + Time.now.to_s
  end

  scenario 'Each new peep has the name and the user handle of who posted it' do
    register_user
    click_button 'New Peep'
    fill_in 'new_peep', with: 'Test peep'
    click_button 'Peep'
    expect(page).to have_content 'Test User at ' + Time.now.to_s
  end
end
