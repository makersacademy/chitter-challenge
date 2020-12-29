feature 'peeps on the /peeps page' do
  scenario 'are displayed in reverse chronological order' do
    visit '/peeps'
    # THIS WILL NEED TO CHANGE TO ENABLE USERS
    click_link 'New Peep'
    fill_in 'peep[message]', with: 'First Peep'
    click_button 'Post Peep'
    click_link 'New Peep'
    fill_in 'peep[message]', with: 'Second Peep'
    click_button 'Post Peep'

    expect(first('.peep')).to have_content 'Second Peep'
  end
end
