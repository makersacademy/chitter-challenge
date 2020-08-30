
scenario 'shows the time at which the peep was posted' do
  visit '/peeps/new_peep'
  fill_in :text, with: 'Test peep'
  click_button 'Post'
  expect(page).to have_content('Test peep')
end
