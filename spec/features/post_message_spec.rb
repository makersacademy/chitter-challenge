feature 'post message' do
  scenario 'user can post a message on chitter' do
    visit('/')
    fill_in :chit, with: 'hey!'
    click_button 'post'
    expect(page).to have_content 'hey!'
  end
end
