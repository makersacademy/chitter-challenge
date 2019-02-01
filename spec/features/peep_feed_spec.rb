feature 'Peep feed' do
  scenario 'Peeps display in reverse cronological order' do
    visit '/peep_feed'
    click_button 'New Peep'
    fill_in 'new_peep', with: 'Test peep'
    click_button 'Peep'
    click_button 'New Peep'
    fill_in 'new_peep', with: 'New test peep'
    click_button 'Peep'
    expect(page).to have_content 'New test peep ' + Time.now.to_s + ' Test peep ' + Time.now.to_s
  end
end
