feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    visit '/'
    fill_in 'text', with: 'Test peep'
    click_button 'Say Something'

    expect(page).to have_content 'Test peep'
  end
end
