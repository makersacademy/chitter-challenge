feature 'posting a beep' do
  scenario 'I want to be able to post a beep' do
    visit '/beeps'
    click_button('New Beep')
    fill_in :message, with: 'This is a test beep'
    click_button('Submit')
    expect(page).to have_content('This is a test beep')
  end
end
