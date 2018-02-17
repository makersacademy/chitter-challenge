feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    visit '/'
    fill_in('peep', with: 'My first peep!')
    click_button 'Peep'

    expect(page).to have_content 'My first peep!'
  end
end
