feature 'As a user' do
  scenario 'You can post a peep to Newsfeed' do
    visit '/peeps'
    fill_in 'peep', with: 'New peep'
    click_button 'Post'
    expect(page).to have_content 'New peep'
  end
end
