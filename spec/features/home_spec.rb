feature 'display all peeps' do
  scenario 'so a user can see all peeps the home page will display them in reverse chronological order' do
    visit '/'
    expect(page).to have_content 'User 1 Peep 1'
    expect(page).to have_content 'User 1 Peep 2'
    expect(page).to have_content 'User 1 Peep 3'
    expect(page).to have_content 'User 2 Peep 1'
    expect(page).to have_content 'User 2 Peep 2'
    expect(page).to have_content 'User 3 Peep 1'
  end
end
