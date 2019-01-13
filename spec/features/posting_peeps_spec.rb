feature 'Posting Peeps' do
  scenario 'A user can post a peep' do
    signup
    visit '/'
    fill_in :peep, with: 'Test peep'
    click_button 'Submit'

    expect(page).to have_content 'Test peep'
  end
end
