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

  scenario 'are displayed with created time/date' do
    Peep.create(message: "peep posted at 21:41 on 29/12/2020", created_at: '2020-12-29 21:41:42.689775')
    visit '/peeps'

    expect(first('.peep')).to have_content '21:41 29/12/2020'
  end
end
