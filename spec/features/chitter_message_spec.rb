feature 'Post Message' do
  scenario 'User can post a message' do
    visit '/peeps'
    expect(page).to have_content('Chitter')
    fill_in :message, with: 'This is a test peep'
    click_button 'Enter'
  end

end
