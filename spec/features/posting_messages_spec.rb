feature 'posting messages to chitter' do
  scenario 'user can post a message and view the message' do
    visit '/chitter'
    fill_in :post_peep, with: 'First Peep'
    click_button 'Post'
    expect(page).to have_content('First Peep')
  end
end
