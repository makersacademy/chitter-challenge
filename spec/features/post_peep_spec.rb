feature 'Allowing the user to post a peep' do
  scenario 'Ensuring the page has a field and button to post a peep' do
    visit '/home'
    expect(page).to have_field 'peep'
    expect(page).to have_button 'Post Peep!'
  end
  scenario 'Ensuring the user\'s Peep is displayed on the page' do
    visit '/home'
    fill_in 'peep', with: 'just stting up my chttr'
    click_button 'Post Peep!'
    expect(page).to have_content 'just setting up my chttr'
  end
end
