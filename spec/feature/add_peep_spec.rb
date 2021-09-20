feature 'Adding a peep' do
  scenario 'User can add a peep to the feed' do
    visit('/feed/new')
    fill_in('peep', with: 'Here is a peep example')
    click_button('Submit')

    expect(page).to have_content 'Here is a peep example'
  end
end
