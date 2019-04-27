feature 'post a message' do
  scenario 'sends post to database' do
    visit '/chitter'
    fill_in('peep', with: 'test message')
    click_button('Post')
    expect(page).to have_content 'test message'
  end
end
