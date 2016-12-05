feature 'creating tweets' do
  scenario 'I can create tweets' do
    sign_up
    visit 'tweets/new'
    fill_in 'message', with: 'just setting up my twtr'
    click_button 'Post tweet'
    save_and_open_page
    expect(current_path).to eq '/twitter'
    within 'ul#tweets' do
      expect(page).to have_content('just setting up my twtr')
    end
  end
end
