feature 'Posting Peeps' do
  scenario 'A user can post a peep' do
    signup
    visit '/'
    fill_in :peep, with: 'Test peep'
    click_button 'Submit'

    expect(page).to have_content 'Test peep'
  end

  scenario 'A user cannot post a peep id they are not signed in' do
    visit '/'
    fill_in :peep, with: 'Test peep'
    click_button 'Submit'

    expect(page).not_to have_content 'Test peep'
    expect(page).to have_content 'You are not signed in'
  end
end
