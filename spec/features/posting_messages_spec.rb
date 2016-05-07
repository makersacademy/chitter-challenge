feature 'posting messages' do
  scenario 'As a user I can post a message' do
    visit '/posts'
    fill_in('title', with: 'News')
    fill_in('message', with: 'Summer has arrived!')
    click_button('Post')
    expect(current_path).to eq '/posts'

    within 'ul#posts' do
      expect(page).to have_content('Summer has arrived!')
      expect(page).to have_content('News')
    end
  end
end
