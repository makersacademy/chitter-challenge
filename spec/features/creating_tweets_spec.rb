feature "Create new tweets" do
  scenario "there is a button to create tweets" do
    visit '/tweets'
    find_button 'New tweet'
  end
  scenario "new tweets can be created and added to the tweets page" do
    visit('/tweets')
    click_button("New tweet")
    fill_in 'message', with: 'Does this actually work?'
    click_button 'Post'

    expect(current_path).to eq '/tweets'

    within 'ul#tweets' do
      expect(page).to have_content 'Does this actually work?'
    end
  end
  scenario "tweets show the time they were posted" do
    visit('/tweets')
    click_button("New tweet")
    fill_in 'message', with: 'test'
    click_button 'Post'

    expect(current_path).to eq '/tweets'

    expect(page).to have_content Time.now.strftime("%A, %d %b %Y %l:%M %p")
  end
  scenario "tweets are displayed in reverse chronological order" do
    visit('/tweets')
    click_button("New tweet")
    fill_in 'message', with: 'Tweet 1'
    click_button 'Post'
    click_button("New tweet")
    fill_in 'message', with: 'Tweet 2'
    click_button 'Post'
    expect(page.body.index("Tweet 2") < page.body.index("Tweet 1")).to eql(true)
  end
end
