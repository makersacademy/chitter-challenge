feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    visit '/'
    fill_in('peep', with: 'A new peep!')
    click_button 'Peep'
    expect(page).to have_content 'A new peep!'
  end
end
