feature 'without logging in' do
  scenario 'can add message to timeline' do
    visit '/'
    fill_in('new_peep', with: 'This is a test message')
    click_button 'submit_new_peep'
    expect(page).to have_content('This is a test message')
    expect(page).to have_content('@anon')
  end
end