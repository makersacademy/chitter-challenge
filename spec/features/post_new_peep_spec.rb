feature 'post peeps' do
  scenario 'user can post a new peep' do
    visit('/peeps/new')
    fill_in :message, with: 'Have a nice day.'
    click_button 'Post peep!'
    expect(page).to have_content 'Have a nice day.'
  end
end