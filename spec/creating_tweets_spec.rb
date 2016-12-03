feature 'creating tweets' do
  scenario 'I can create tweets' do
    visit 'tweets/new'
    fill_in 'message', with: 'just setting up my twtr'
    click_button 'Post tweet'
    expect(current_path).to eq '/twitter'
    within 'ul#tweets' do
      expect(page).to have_content('just setting up my twtr')
    end
  end
end
