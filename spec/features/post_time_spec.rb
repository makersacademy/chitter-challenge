feature 'peeps with timestamps' do
  scenario 'user can see peeps and the time they were posted' do
    visit '/chitter'
    fill_in :post_peep, with: 'Peep The Time'
    click_button 'Submit'
    expect(page).to have_content('created at')
  end
end
