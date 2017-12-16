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
end
