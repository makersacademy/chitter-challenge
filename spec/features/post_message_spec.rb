feature 'Posting a message' do
  scenario 'A user can post a peep to chitter public stream' do
    visit '/peeps/new'
    fill_in('content', with: 'This is a test peep!')
    click_button 'Post'
    expect(page).to have_content 'This is a test peep!'
  end
end
