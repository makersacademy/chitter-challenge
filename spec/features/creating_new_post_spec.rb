feature 'can create new posts' do
  scenario 'can create a new post and see it on the feed' do
    visit '/chitter_feed/new'
    fill_in('content', with: 'I have created a new post...')
    click_button('Submit')

    expect(page).to have_content 'I have created a new post...'
  end
end
